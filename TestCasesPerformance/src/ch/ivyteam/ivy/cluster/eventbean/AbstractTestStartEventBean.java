package ch.ivyteam.ivy.cluster.eventbean;

import org.eclipse.core.runtime.IProgressMonitor;

import ch.ivyteam.ivy.process.eventstart.AbstractProcessStartEventBean;
import ch.ivyteam.ivy.process.eventstart.IProcessStartEventBeanRuntime;
import ch.ivyteam.ivy.project.IIvyProject;
import ch.ivyteam.ivy.project.IvyProjectNavigationUtil;
import ch.ivyteam.ivy.service.ServiceException;

@SuppressWarnings("restriction")
public abstract class AbstractTestStartEventBean  extends AbstractProcessStartEventBean  {

	private ClusterLogger fClusterLogger;

	protected AbstractTestStartEventBean(String name, String description) {
		super(name, description);
	}

	@Override
	public void initialize(IProcessStartEventBeanRuntime eventRuntime, String configuration) {
		super.initialize(eventRuntime, configuration);
		IIvyProject ivyProject = IvyProjectNavigationUtil.getIvyProject(eventRuntime.getProcessModelVersion());
		fClusterLogger = new ClusterLogger(ivyProject.getProject());
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
		fClusterLogger.logBeanRunningStateChange(this.getClass().getSimpleName(), isRunning());
	}
}
