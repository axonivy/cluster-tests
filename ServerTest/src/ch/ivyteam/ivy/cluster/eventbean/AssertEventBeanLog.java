package ch.ivyteam.ivy.cluster.eventbean;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.junit.Assert;
import org.junit.Test;

/**
 * Asserts the created log the startup and shutdown behavior of 
 * Start- and Intermediate-Event-Beans with two clusters.
 * <p>
 * This class is called from the ClusterTests.xml as a JUnit Test.
 * In this ant-script also the startup and shutdown of the nodes 
 * is implemented.
 * </p> 
 * @author fs
 * @since 19.01.2011
 */
public class AssertEventBeanLog extends Assert
{
  
  /**
   * This class implements the assertion of the log file with the
   * generated remote log file.
   * @throws Exception
   */
  @Test
  public void testClusterIntermediateEventBean() throws Exception
  {
    assertBean("ClusterIntermediateEventBean");
  }
  
  /**
   * This class implements the assertion of the log file with the
   * generated remote log file.
   * @throws Exception
   */
  @Test
  public void testClusterStartEventBean() throws Exception
  {
    assertBean("ClusterStartEventBean");
  }
  
  /**
   * This class implements the assertion of the log file with the
   * generated remote log file.
   * @throws Exception
   */
  @Test
  public void testMasterIntermediateEventBean() throws Exception
  {
    assertBean("MasterIntermediateEventBean");
  }

  /**
   * This class implements the assertion of the log file with the
   * generated remote log file.
   * @throws Exception
   */
  @Test
  public void testMasterStartEventBean() throws Exception
  {
    assertBean("MasterStartEventBean");
  }

  /**
   * @param beanName
   * @param remoteBaseUri
   * @return The URl to the log file of the given bean
   */
  public static String getRemoteLogUrl(String remoteBaseUri, String beanName)
  {
    return remoteBaseUri + "/ivy/page/System/TestCasesPerformance/log/statechange_"+ beanName +".log";
  }

  /**
   * @param beanName 
   * @throws IOException 
   * @throws URISyntaxException 
   * @throws Exception 
   */
  private void assertBean(String beanName) throws Exception
  {
    // Check node 1
    assertLog(beanName, 1, System.getProperty("node1.baseUri", "http://localhost:18080"));
    // Check node 2
    assertLog(beanName, 2, System.getProperty("node2.baseUri", "http://localhost:18081"));
  }
  
  /**
   * Asserts the content log of the remote node with the 'local log file'.
   * @param beanName 
   * @param nodeId 
   * @param remoteBaseUri 
   * @throws URISyntaxException 
   * @throws IOException 
   * @throws MalformedURLException 
   */
  private void assertLog(String beanName, int nodeId, String remoteBaseUri) throws URISyntaxException, IOException, MalformedURLException
  {
    String remoteUrl = getRemoteLogUrl(remoteBaseUri, beanName);
    String localFilePath = "Assert" + beanName +"-node"+ String.valueOf(nodeId) + ".log";
    URI expectedFileUrl = AssertEventBeanLog.class.getResource(localFilePath).toURI();
    String expected = FileUtils.readFileToString(new File(expectedFileUrl));
    String actual = getRemoteContent(remoteUrl);

    assertEquals("Start or stop of Start- or Entermediate-Event-Beans on cluster node " + nodeId, expected.replace("\r\n", "\n"), actual);
  }

  /**
   * @param uri
   * @return The log content of the given node at the remote cluster
   * @throws MalformedURLException
   * @throws IOException
   */
  private String getRemoteContent(String uri) throws MalformedURLException, IOException
  {
    InputStream is = null;
    URL url = new URL(uri);
    try
    {
      is = url.openStream();
      return IOUtils.toString(is);
    }
    finally
    {
      IOUtils.closeQuietly(is);
    }
  }
}
