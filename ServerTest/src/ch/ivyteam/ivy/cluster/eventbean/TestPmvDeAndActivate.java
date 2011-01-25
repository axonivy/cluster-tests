package ch.ivyteam.ivy.cluster.eventbean;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.junit.Assert;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

/**
 * Tests that bean are started and stopped correctly in a cluster environment.
 */
public class TestPmvDeAndActivate extends Assert
{
  /** Name of the testing process model version (where the bean are deplayed) */
  private static final String PROCESS_MODEL_NAME = "TestCasesPerformance";

  /**  */
  private static final String RESULT_OK = "Result OK";
  /**  */
  private static final String RESULT_STATE_ACTIVE = "Result State: ACTIVE";
  /**  */
  private static final String RESULT_STATE_INACTIVE = "Result State: INACTIVE";

  /**  */
  private static final String CLEAR_EVENT_BEAN_LOG_LINK = "/ivy/pro/System/TestCasesPerformance/12D992D7A5DD33E0/clearEventBeanLog.ivp?beanName=";
  /**  */
  private static final String GET_ACTIVITY_STATE_LINK = "/ivy/pro/System/TestUtilProjectDeployment/12DBC4D60E7D574C/getActivityOperationState.ivp";
  /**  */
  private static final String DEACTIVATE_LINK = "/ivy/pro/System/TestUtilProjectDeployment/12DBC4D60E7D574C/deactivate.ivp";
  /**  */
  private static final String ACTIVATE_LINK = "/ivy/pro/System/TestUtilProjectDeployment/12DBC4D60E7D574C/activate.ivp";
  /**  */
  private static final List<String> PROJECT_MODEL_BEANS = new ArrayList<String>();

  /** */
  private String fNode1BaseUrl;
  /**  */
  private String fNode2BaseUrl;
  
  static {
    PROJECT_MODEL_BEANS.add("ClusterIntermediateEventBean");
    PROJECT_MODEL_BEANS.add("ClusterStartEventBean");
    PROJECT_MODEL_BEANS.add("MasterIntermediateEventBean");
    PROJECT_MODEL_BEANS.add("MasterStartEventBean");
  }
  
  /**
   * @throws Exception 
   */
  @BeforeClass
  public static void setup() throws Exception
  {
    String node1BaseUrl = System.getProperty("node1.baseUri", "http://localhost:18080");
    String node2BaseUrl = System.getProperty("node2.baseUri", "http://localhost:18081");
   
    // assert pmv up
    String stateNode1 = getFinalContent(createPvmLinkFile(node1BaseUrl, GET_ACTIVITY_STATE_LINK));
    String stateNode2 = getFinalContent(createPvmLinkFile(node2BaseUrl, GET_ACTIVITY_STATE_LINK));
    assertEquals("Check initial state of node 1", RESULT_STATE_ACTIVE, stateNode1);
    assertEquals("Check initial state of node 2", RESULT_STATE_ACTIVE, stateNode2);
        
    // call clear log file
    clearAllBeanLogs(node1BaseUrl);
    clearAllBeanLogs(node2BaseUrl);
    
    // *** stop pmv on node 1 ***
    stateNode1 = getFinalContent(createPvmLinkFile(node1BaseUrl, DEACTIVATE_LINK));
    assertEquals("Check state of node action 'deactivate pmv'", RESULT_OK, stateNode1);
    
    waitForPmvState(node1BaseUrl, RESULT_STATE_INACTIVE);
    waitForPmvState(node2BaseUrl, RESULT_STATE_INACTIVE);
    
    // check state on node 1 and 2
    stateNode1 = getFinalContent(createPvmLinkFile(node1BaseUrl, GET_ACTIVITY_STATE_LINK));
    stateNode2 = getFinalContent(createPvmLinkFile(node2BaseUrl, GET_ACTIVITY_STATE_LINK));
    assertEquals("Check state of node 1 after deactivation", RESULT_STATE_INACTIVE, stateNode1);
    assertEquals("Check state of node 2 after deactivation", RESULT_STATE_INACTIVE, stateNode2);
    
    // *** start pmv on node 1 *** 
    stateNode1 = getFinalContent(createPvmLinkFile(node1BaseUrl, ACTIVATE_LINK));
    assertEquals("Check state of node action 'activate pmv'", RESULT_OK, stateNode1);
    
    waitForPmvState(node1BaseUrl, RESULT_STATE_ACTIVE);
    waitForPmvState(node2BaseUrl, RESULT_STATE_ACTIVE);
    
    // check state on node 1 and 2
    stateNode1 = getFinalContent(createPvmLinkFile(node1BaseUrl, GET_ACTIVITY_STATE_LINK));
    stateNode2 = getFinalContent(createPvmLinkFile(node2BaseUrl, GET_ACTIVITY_STATE_LINK));
    assertEquals("Check state of node 1 after activation", RESULT_STATE_ACTIVE, stateNode1);
    assertEquals("Check state of node 2 after activation", RESULT_STATE_ACTIVE, stateNode2);
    
  }
  
  /**
   * 
   */
  @Before
  public void init()
  {
    fNode1BaseUrl = System.getProperty("node1.baseUri", "http://localhost:18080");
    fNode2BaseUrl = System.getProperty("node2.baseUri", "http://localhost:18081");
  }
  
  /**
   * @throws Exception
   */
  @Test
  public void testClusterIntermediateEventBean() throws Exception
  {
    assertEventBeanLogs(true, fNode1BaseUrl, "ClusterIntermediateEventBean");
    assertEventBeanLogs(false, fNode2BaseUrl, "ClusterIntermediateEventBean");
  }
  
  /**
   * @throws Exception
   */
  @Test
  public void testClusterStartEventBean() throws Exception
  {
    assertEventBeanLogs(true, fNode1BaseUrl, "ClusterStartEventBean");
    assertEventBeanLogs(false, fNode2BaseUrl, "ClusterStartEventBean");
  }
  
  /**
   * @throws Exception
   */
  @Test
  public void testMasterIntermediateEventBean() throws Exception
  {
    assertEventBeanLogs(true, fNode1BaseUrl, "MasterIntermediateEventBean");
    assertEventBeanLogs(false, fNode2BaseUrl, "MasterIntermediateEventBean");
  }
  
  /**
   * @throws Exception
   */
  @Test
  public void testMasterStartEventBean() throws Exception
  {
    assertEventBeanLogs(true, fNode1BaseUrl, "MasterStartEventBean");
    assertEventBeanLogs(false, fNode2BaseUrl, "MasterStartEventBean");
  }

  /**
   * @param isMaster 
   * @param baseUrl 
   * @param beanName 
   * @throws Exception 
   */
  private static void assertEventBeanLogs(boolean isMaster, String baseUrl, String beanName) throws Exception
  {
    boolean isAffected = false;
    String logContent = "";
    String remoteUrl = AssertEventBeanLog.getRemoteLogUrl(baseUrl, beanName);
    
    StringBuilder expectedContent = new StringBuilder("");
    if (beanName.startsWith("Cluster"))
    {
      // cluster able beans are always affected
      isAffected = true;
    }
    else if (beanName.startsWith("Master"))
    {
      // master beans are only on a master node active
      isAffected = isMaster;
    }
    else
    {
      throw new IllegalStateException("Beantype '"+ beanName +"' is unknown.");
    }
    
    if (isAffected)
    {
      logContent = getFinalContent(remoteUrl);
      
      expectedContent.append("Bean '");
      expectedContent.append(beanName);
      expectedContent.append("' is 'STOPPING'\n");
      
      expectedContent.append("Bean '");
      expectedContent.append(beanName);
      expectedContent.append("' is 'STARTING'\n");
      
      assertEquals("Checking start/stop log message of bean '"+ beanName +"' on baseurl " + baseUrl, expectedContent.toString(), logContent);
    }
    else
    {
      try
      {
        // must thrown an exception, because log file does not exist
        getFinalContent(remoteUrl);
        fail("Checking start/stop log message on baseurl " + baseUrl + ": for bean '"+ beanName +"' must no log file exist.");
      }
      catch(Exception ex)
      {
        // must thrown
      }
    }
  }

  /**
   * @param baseUrl 
   * @param resultStateActive 
   * @throws Exception 
   */
  private static void waitForPmvState(String baseUrl, String resultStateActive) throws Exception
  {
    int sleepCounter = 0;
    while(sleepCounter < 400)
    {
      String pmvState = getFinalContent(createPvmLinkFile(baseUrl, GET_ACTIVITY_STATE_LINK));
      if (pmvState.equals(resultStateActive))
      {
        return;
      }
      sleepCounter++;
      Thread.sleep(250);
    }
  }

  /**
   * @param baseUrl
   * @throws Exception
   */
  private static void clearAllBeanLogs(String baseUrl) throws Exception
  {
    for (String beanName : PROJECT_MODEL_BEANS)
    {
      clearBeanLogs(baseUrl, beanName);
    }
  }
  
  /**
   * @param baseUrl
   * @param beanName
   * @throws Exception 
   */
  private static void clearBeanLogs(String baseUrl, String beanName) throws Exception
  {
    String state = getFinalContent(baseUrl + CLEAR_EVENT_BEAN_LOG_LINK + beanName);
    assertEquals("Check state of clearing log files", "DONE", state);
  }
  
  /**
   * @param baseUrl 
   * @param link 
   * @return The link 
   */
  private static String createPvmLinkFile(String baseUrl, String link)
  {
    return baseUrl + link + "?pm=" + PROCESS_MODEL_NAME;
  }
  
  /**
   * @param url
   * @return Content of the URL
   * @throws Exception
   */
  private static String getFinalContent(String url) throws Exception
  {
    HttpClient client;
    client = new DefaultHttpClient();
    HttpGet httpget = new HttpGet(url);
    return client.execute(httpget, new BasicResponseHandler());
  }
}
