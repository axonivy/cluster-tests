package ch.ivyteam.testutilprojectdeployment;

import java.util.List;
import java.util.concurrent.Callable;

import ch.ivyteam.ivy.application.IProcessModel;
import ch.ivyteam.ivy.application.IProcessModelVersion;
import ch.ivyteam.ivy.environment.Ivy;
import ch.ivyteam.ivy.persistence.PersistencyException;
import ch.ivyteam.ivy.security.ISecurityManager;
import ch.ivyteam.ivy.security.SecurityManagerFactory;

public final class ProcessModelVersionHelper {

	public static final String OK_MESSAGE = "OK";
	
	private ProcessModelVersionHelper() {
	}

	public static String activate(final String projectName) throws Exception
	{
		final ISecurityManager securityManager = SecurityManagerFactory.getSecurityManager();
		return securityManager.executeAsSystem(new Callable<String>() 
		{
			@Override
			public String call() throws Exception 
			{
				try
				{
					IProcessModelVersion pmv = getPmv(projectName);
					pmv.activate();
					return OK_MESSAGE;
				}
				catch (Exception ex) 
				{
					Ivy.log().error("Exception in PmvTaskHelper.pmvStart(): ", ex);
					return "Error (for more details see ivy-error-log): " + ex.getMessage();
				}
			}
		});
	}
	
	public static String deactivate(final String projectName) throws Exception
	{
		final ISecurityManager securityManager = SecurityManagerFactory.getSecurityManager();
		return securityManager.executeAsSystem(new Callable<String>() 
		{
			@Override
			public String call() throws Exception 
			{
				try
				{
					IProcessModelVersion pmv = getPmv(projectName);
					pmv.deactivate();
					return OK_MESSAGE;
				}
				catch (Exception ex) 
				{
					Ivy.log().error("Exception in PmvTaskHelper.pmvStop(): ", ex);
					return "Error (for more details see ivy-error-log): " + ex.getMessage();
				}
			}
		});
	}
	
	public static String getActivityState(final String projectName) throws Exception
	{
		final ISecurityManager securityManager = SecurityManagerFactory.getSecurityManager();
		return securityManager.executeAsSystem(new Callable<String>() 
		{
			@Override
			public String call() throws Exception 
			{
				try
				{
					IProcessModelVersion pmv = getPmv(projectName);
					return "State: " + pmv.getActivityStateText();
				}
				catch (Exception ex) 
				{
					Ivy.log().error("Exception in PmvTaskHelper.pmvStop(): ", ex);
					return "Error (for more details see ivy-error-log): " + ex.getMessage();
				}
			}
		});
	}
	
	private static IProcessModelVersion getPmv(final String projectName) throws PersistencyException 
	{
		List<IProcessModel> processModels = Ivy.wf().getApplication().getProcessModels();
		for (IProcessModel pm : processModels) 
		{
			if (!pm.getName().equals(projectName))
			{
				continue;
			}
			if (pm.getProcessModelVersions().size() != 1)
			{
				throw new IllegalStateException("There is no or more then one PMV in project " + projectName);
			}
			return pm.getProcessModelVersions().get(0);
		}
		throw new IllegalStateException("Could not find PM for project " + projectName);
	}	
}
