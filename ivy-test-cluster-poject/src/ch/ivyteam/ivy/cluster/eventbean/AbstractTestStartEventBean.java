package ch.ivyteam.ivy.cluster.eventbean;

import org.eclipse.core.runtime.IProgressMonitor;

import ch.ivyteam.ivy.process.eventstart.AbstractProcessStartEventBean;
import ch.ivyteam.ivy.service.ServiceException;

public abstract class AbstractTestStartEventBean extends AbstractProcessStartEventBean {

  protected AbstractTestStartEventBean(String name, String description) {
    super(name, description);
  }

  @Override
  public void start(IProgressMonitor monitor) throws ServiceException {
    super.start(monitor);
    printStateChange();
  }

  @Override
  public void stop(IProgressMonitor monitor) throws ServiceException {
    super.stop(monitor);
    printStateChange();
  }

  private void printStateChange() {
    try {
      ClusterLogger.logBeanRunningStateChange(this.getClass().getSimpleName(), isRunning());
    } catch (Exception ex) {
      throw new IllegalStateException("Test case / environment is not set up correctly.", ex);
    }
  }
}
