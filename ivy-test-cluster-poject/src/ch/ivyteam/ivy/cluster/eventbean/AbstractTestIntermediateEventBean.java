package ch.ivyteam.ivy.cluster.eventbean;

import org.eclipse.core.resources.IProject;
import org.eclipse.core.runtime.IProgressMonitor;

import ch.ivyteam.ivy.process.intermediateevent.AbstractProcessIntermediateEventBean;
import ch.ivyteam.ivy.process.intermediateevent.IProcessIntermediateEventBeanRuntime;
import ch.ivyteam.ivy.project.IIvyProject;
import ch.ivyteam.ivy.project.IvyProjectNavigationUtil;
import ch.ivyteam.ivy.service.ServiceException;

/**
 * @author fs
 */
@SuppressWarnings("restriction")
public abstract class AbstractTestIntermediateEventBean extends AbstractProcessIntermediateEventBean {

	private IProject project;

	public AbstractTestIntermediateEventBean(String name, String description, Class<?> resultObjectClass) {
		super(name, description, resultObjectClass);
	}

	@Override
	public void initialize(IProcessIntermediateEventBeanRuntime eventRuntime,
			String configuration) {
		super.initialize(eventRuntime, configuration);
		try {
			IIvyProject ivyProject = IvyProjectNavigationUtil.getIvyProject(eventRuntime.getIntermediateEventElement().getProcessModelVersion());
			project = ivyProject.getProject();
		} catch (Exception e) {
			throw new IllegalStateException("PMV is not available");
		}
	}
	
	@Override
	public void start(IProgressMonitor monitor) throws ServiceException 
	{
		super.start(monitor);
		printStateChange();
	}
	
	@Override
	public void stop(IProgressMonitor monitor) throws ServiceException 
	{
		super.stop(monitor);
		printStateChange();
	}
	
	private void printStateChange()
	{
		try {
			ClusterLogger.logBeanRunningStateChange(project, this.getClass().getSimpleName(), isRunning());
		} 
		catch (Exception ex) 
		{
			throw new IllegalStateException("Test case / environment is not set up correctly.", ex);
		}
	}
}
