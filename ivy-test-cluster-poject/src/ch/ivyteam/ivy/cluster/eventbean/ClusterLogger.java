package ch.ivyteam.ivy.cluster.eventbean;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.Callable;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.exception.ExceptionUtils;
import org.eclipse.core.resources.IProject;

import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.security.SecurityManagerFactory;

public class ClusterLogger
{
	/**
	 * Creates a log entry with the given parameter
	 * @param beanName
	 * @param started
	 * @throws IOException 
	 */
	public static void logBeanRunningStateChange(IProject project, String beanName, boolean started) throws IOException
	{
		File logFile = getLogFile(project, beanName);
		appendString(logFile, "Bean '"+ beanName +"' is '"+ (started ? "STARTING" : "STOPPING") +"'");
		File detailLogfile = getDetailLogFile(project, beanName);
		appendString(detailLogfile, "Bean '"+ beanName +"' is '"+ (started ? "STARTING" : "STOPPING") +"'"  + " on " + InetAddress.getLocalHost().getHostName() + "\n" + ExceptionUtils.getStackTrace(new Exception()) + "\n------------");
		
	}

	/**
	 * Calls the method {@link #getContentAsString()} as system user. 
	 * This method could only be called inside a process request.
	 * @return
	 * @throws Exception
	 */
	public static String getContentAsSystemUser(final String beanName) throws Exception
	{
		return SecurityManagerFactory.getSecurityManager().executeAsSystem(new Callable<String>() {
			@SuppressWarnings("restriction")
			@Override
			public String call() throws Exception {
				IProject project = Ivy.request().getProject().getProject(); 
				return ClusterLogger.getContentAsString(project, beanName);
			}
		});
	}

	/**
	 * Calls the method {@link #deleteEventBeanLog()} as system user. 
	 * This method could only be called inside a process request.
	 * @throws Exception
	 */
	public static void deleteEventBeanLogAsSystemUser(final String beanName) throws Exception
	{
		SecurityManagerFactory.getSecurityManager().executeAsSystem(new Callable<Void>() {
			@SuppressWarnings("restriction")
			@Override
			public Void call() throws Exception {
				IProject project = Ivy.request().getProject().getProject();
				ClusterLogger.deleteEventBeanLog(project, beanName);
				return null;
			}
		});
	}

	/**
	 * Clears the event bean log
	 */
	private static void deleteEventBeanLog(IProject project, String beanName)
	{
		File outputFile = getLogFile(project, beanName);
		if (outputFile.exists())
		{
			outputFile.delete();
		}
		File detailOutputFile = getDetailLogFile(project, beanName);
		if (detailOutputFile.exists())
		{
			detailOutputFile.delete();
		}
	}

	/**
	 * @return the content of the event bean log. If the file does not exist, an empty string is returned.
	 * @throws IOException
	 */
	private static String getContentAsString(IProject project, String beanName) throws IOException
	{
		File outputFile = getLogFile(project, beanName);
		if (outputFile.exists())
		{
			return FileUtils.readFileToString(outputFile, StandardCharsets.UTF_8);
		}
		else
		{
			return "";
		}
	}

	private static void appendString(File logFile, String message) throws IOException
	{
        try(FileWriter writer = new FileWriter(logFile, true)) {
        	writer.append(message + "\n");
        }
	}

	private static File getLogFile(IProject project, String beanName)
	{
		return getFile("log/statechange_"+ beanName +".log");
	}
	
	private static File getDetailLogFile(IProject project, String beanName)
	{
		return getFile("log/statechange_"+ beanName +"_detail.log");
	}

	private static File getFile(String path) {
		ch.ivyteam.ivy.scripting.objects.File ivyFile = null;
		try {
			ivyFile = new ch.ivyteam.ivy.scripting.objects.File(path , false);
			ivyFile.createNewFile();
			return ivyFile.getJavaFile();
		} catch (IOException ex) {
			String file = ivyFile != null ? ivyFile.getJavaFile().getPath() : path;
			throw new RuntimeException("Could not get log file '" + file + "'", ex);
		}
	}
}