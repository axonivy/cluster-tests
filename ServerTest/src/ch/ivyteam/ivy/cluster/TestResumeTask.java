package ch.ivyteam.ivy.cluster;

import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.junit.Assert;
import org.junit.Test;

/**
 * Tests that only one session can resume a task even if session 1 is working on another cluster node than session 2
 * @author rwei
 * @since 17.01.2011
 */
public class TestResumeTask extends Assert
{
  /**
   * A thread that simulates a http client 
   * @author rwei
   * @since 17.01.2011
   */
  private class HttpClientThread extends Thread 
  {
    /**  */
    private static final int STATE_TASK_RESUME_RESPONSE_RECEIVED = 3;

    /**  */
    private static final int STATE_WAIT_FOR_TASK_RESUME_RESPONSE = 2;

    /**  */
    private static final int STATE_TASK_URL_RECEIVED = 1;

    /**  */
    private static final int STATE_WAIT_FOR_TASK_URL = 0;

    /**  */
    private static final int STATE_ERROR_OR_DONE = -1;

    /** The http response code after trying to resume a task */
    private int fResponseCode;
    
    /** The uri to start a task */
    private String fTaskStartUri;
    
    /** Any error that occur */
    private Throwable fError;
    
    /** The state of the client */
    private int fState = STATE_WAIT_FOR_TASK_URL;

    /** The host to request */
    private String fHostBaseUri;       
        
    /**
     * Constructor
     * @param hostBaseUri the host where the http client should request to
     */
    public HttpClientThread(String hostBaseUri)
    {
      fHostBaseUri = hostBaseUri;
    }

    /**
     * @see java.lang.Thread#run()
     */
    @Override
    public void run()
    {
      HttpClient client;
      client = new DefaultHttpClient();

      try
      {
        HttpGet httpget = new HttpGet(fHostBaseUri+"/ivy/pro/"+APPLICATION_NAME+"/TestCasesPerformance/12D851E10A821416/start.ivp");
        
        while (fState >= STATE_WAIT_FOR_TASK_URL)
        {          
          setTaskStartUri(client.execute(httpget, new BasicResponseHandler()));
          HttpGet startTask = new HttpGet(fTaskStartUri);
          HttpResponse response = client.execute(startTask);
          setResponseCode(response.getStatusLine().getStatusCode());
          startTask.abort();
        }
      }
      catch(Exception ex)
      {
        synchronized(this)
        {
          fState = STATE_ERROR_OR_DONE;
          fError = ex;
          notifyAll();
        }
      }
      finally
      {
        client.getConnectionManager().shutdown();
      }
    }

    /**
     * @param statusCode
     * @throws InterruptedException 
     */
    private void setResponseCode(int statusCode) throws InterruptedException
    {
      fResponseCode = statusCode;
      waitForMainThread(STATE_TASK_RESUME_RESPONSE_RECEIVED, STATE_WAIT_FOR_TASK_URL);
    }

    /**
     * Sets the task start uri
     * @param uri
     * @throws InterruptedException 
     */
    private synchronized void setTaskStartUri(String uri) throws InterruptedException
    {
      fTaskStartUri = uri;
      waitForMainThread(STATE_TASK_URL_RECEIVED, STATE_WAIT_FOR_TASK_RESUME_RESPONSE);
    }

    /**
     * Sets a new status and notifies the main thread. Then waits till the main thread has set the given status
     * @param statusToSet the status to set before notifying the main thread  
     * @param statusToWaitFor the status to wait for until the main thread sets it.
     * @throws InterruptedException 
     */
    private synchronized void waitForMainThread(int statusToSet, int statusToWaitFor) throws InterruptedException
    {   
      fState = statusToSet;
      notifyAll();
      while (fState != STATE_ERROR_OR_DONE && fState != statusToWaitFor)
      {
        wait();
      }
      
    }

    /**
     * Gets the task start uri
     * @return task start uri
     * @throws Throwable 
     */
    public synchronized String getTaskStartUri() throws Throwable
    {
      while (fState != STATE_ERROR_OR_DONE && fState != STATE_TASK_URL_RECEIVED)
      {
        wait();
      }
      if (fError != null)
      {
        throw fError;
      }
      String uri = fTaskStartUri;
      return uri;
    }

    /**
     * Gets the response status code
     * @return response status code
     * @throws Throwable 
     */
    public synchronized int getStatusCode() throws Throwable
    {
      while (fState != STATE_ERROR_OR_DONE && fState != STATE_TASK_RESUME_RESPONSE_RECEIVED)
      {
        wait();
      }
      if (fError != null)
      {
        throw fError;
      }
      int code = fResponseCode;
      return code;
    }

    /**
     * Kill the http client
     */
    public synchronized void kill()
    {
      fState = STATE_ERROR_OR_DONE;
      notifyAll();
    }

    /**
     * Go to the next step
     */
    public synchronized void go()
    {
      if (fState == STATE_TASK_URL_RECEIVED)
      {
        fState = STATE_WAIT_FOR_TASK_RESUME_RESPONSE;
      }
      else if (fState == STATE_TASK_RESUME_RESPONSE_RECEIVED)
      {
        fState = STATE_WAIT_FOR_TASK_URL;
      }
        
      notifyAll();
    }
  }

  /** The host and port where the first cluster node is running */
  private static final String CLUSTER_NODE_1_BASE_URI = System.getProperty("node1.baseUri", "http://localhost:18080");
  /** The host and port where the second cluster node is running */
  private static final String CLUSTER_NODE_2_BASE_URI = System.getProperty("node1.baseUri", "http://localhost:18080");
  /** The application name where the test process is deployed to */
  private static final String APPLICATION_NAME = "System"; // designer
  
  /**
   * Tests resuming a task by two different session on two different cluster nodes
   * @throws Throwable
   */
  @Test
  public void testResumeTask() throws Throwable
  {
    HttpClientThread thread1;
    HttpClientThread thread2;
    
    
    //Create Task
    HttpClient client = new DefaultHttpClient();
    try
    {
      client.execute(new HttpGet(CLUSTER_NODE_1_BASE_URI+"/ivy/pro/"+APPLICATION_NAME+"/TestCasesPerformance/12D851E10A821416/start2.ivp"), new BasicResponseHandler());
    }
    finally
    {
      client.getConnectionManager().shutdown();
    }
    
    thread1 = new HttpClientThread(CLUSTER_NODE_1_BASE_URI);
    thread2 = new HttpClientThread(CLUSTER_NODE_2_BASE_URI);
    
    thread1.start();
    thread2.start();
    
    try
    {
      for (int count=0; count < 500; count++)
      {
        thread1.go();
        thread2.go();
        
        assertEquals("Both task start uri must be for the same task", 
                thread1.getTaskStartUri().substring((CLUSTER_NODE_1_BASE_URI).length()), 
                thread2.getTaskStartUri().substring((CLUSTER_NODE_2_BASE_URI).length()));
        
        thread1.go();
        thread2.go();

        int code1 = thread1.getStatusCode();
        int code2 = thread2.getStatusCode();
        
        if (code1 == HttpStatus.SC_OK)
        {
          assertEquals("Status code should be", HttpStatus.SC_OK, code1);
          assertEquals("Status code should be", HttpStatus.SC_CONFLICT, code2);
        }
        else
        {
          assertEquals("Status code should be", HttpStatus.SC_CONFLICT, code1);
          assertEquals("Status code should be", HttpStatus.SC_OK, code2);
        }
      }
    }
    finally
    {
      thread1.kill();
      thread2.kill();
    }
  }
}
