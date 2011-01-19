package ch.ivyteam.ivy.cluster.eventbean;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.concurrent.Callable;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.eclipse.core.resources.IProject;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.persistence.PersistencyException;
import ch.ivyteam.ivy.security.SecurityManagerFactory;
import ch.ivyteam.ivy.server.ServerFactory;
import ch.ivyteam.log.Logger;

@SuppressWarnings("restriction")
public class ClusterLogger
{
	
	private final IProject fProject;

	public ClusterLogger(IProject project) {
		fProject = project;
	}

	/**
	 * Calls the method {@link #getContentAsString()} as system user. 
	 * This method could only be called inside a process request.
	 * @return
	 * @throws Exception
	 */
	public static String getContentAsSystemUser() throws Exception
	{
		return SecurityManagerFactory.getSecurityManager().executeAsSystem(new Callable<String>() {
			@Override
			public String call() throws Exception {
				return new ClusterLogger(Ivy.request().getProject().getProject()).getContentAsString();
			}
		});
	}
	
	/**
	 * Calls the method {@link #clearEventBeanLog()} as system user. 
	 * This method could only be called inside a process request.
	 * @throws Exception
	 */
	public static void clearEventBeanLogAsSystemUser() throws Exception
	{
		SecurityManagerFactory.getSecurityManager().executeAsSystem(new Callable<Void>() {
			@Override
			public Void call() throws Exception {
				new ClusterLogger(Ivy.request().getProject().getProject()).clearEventBeanLog();
				return null;
			}
		});
	}
	
	/**
	 * Clears the event bean log
	 */
	public void clearEventBeanLog()
	{
		File outputFile = getOutputFile();
		if (outputFile.exists())
		{
			outputFile.delete();
		}
	}
	
	/**
	 * @return the content of the event bean log. If the file does not exist, an empty string is returned.
	 * @throws IOException
	 */
	public String getContentAsString() throws IOException
	{
		File outputFile = getOutputFile();
		if (outputFile.exists())
		{
			return FileUtils.readFileToString(outputFile);
		}
		else
		{
			return "";
		}
	}

	/**
	 * Creates a log entry with the given parameter
	 * @param beanName
	 * @param started
	 */
	public void logBeanRunningStateChange(String beanName, boolean started)
	{
		String nodeName = getNodeName();
		logString("Bean '"+ beanName +"' on node '"+ nodeName +"' is '"+ (started ? "STARTING" : "STOPPING") +"'");
	}
	
	/**
	 * Creates a log entry with the stack trace of the given {@link Throwable}.
	 * @param th
	 */
	public void logThrowable(Throwable th)
	{
		String stackTrace = ExceptionUtils.getStackTrace(th);
		logString(stackTrace);
	}
	
	private void logString(String message)
	{
		try
		{
			BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(getOutputFile(), true));
	        try {
	        	bufferedWriter.append(message + "\n");
	        } finally {
	            IOUtils.closeQuietly(bufferedWriter);
	        }
		}
		catch (Exception e) 
		{
			Logger.getClassLogger(ClusterLogger.class).error("Error while writing cluster log entry in testcase", e);
			throw new IllegalStateException("Error while writing cluster log entry", e);
		}
	}

	private static String getNodeName() {
		String nodeName;
		try {
			nodeName = ServerFactory.getServer().getClusterManager().getLocalClusterNode().getName();
		} catch (PersistencyException e) {
			nodeName = "ERROR_GET_CLUSTERNAME";
		}
		return nodeName;
	}

	private File getOutputFile()
	{
		return fProject.getFolder("log").getFile("ClusterLogger_" + getNodeName() + ".log").getLocation().toFile();
	}
}
