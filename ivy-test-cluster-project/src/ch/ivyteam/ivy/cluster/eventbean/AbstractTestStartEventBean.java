package ch.ivyteam.ivy.cluster.eventbean;

import ch.ivyteam.ivy.process.eventstart.AbstractProcessStartEventBean;
import ch.ivyteam.ivy.service.ServiceException;

public abstract class AbstractTestStartEventBean extends AbstractProcessStartEventBean {

  protected AbstractTestStartEventBean(String name, String description) {
    super(name, description);
  }

  @Override
  public void start() throws ServiceException {
    super.start();
    printStateChange(true);
  }

  @Override
  public void stop() throws ServiceException {
    super.stop();
    printStateChange(false);
  }

  private void printStateChange(boolean starting) {
    try {
      ClusterLogger.logBeanRunningStateChange(this.getClass().getSimpleName(), starting);
    } catch (Exception ex) {
      throw new IllegalStateException("Test case / environment is not set up correctly.", ex);
    }
  }
}
