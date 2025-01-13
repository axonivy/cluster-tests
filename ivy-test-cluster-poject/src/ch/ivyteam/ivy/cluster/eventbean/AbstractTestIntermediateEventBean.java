package ch.ivyteam.ivy.cluster.eventbean;

import ch.ivyteam.ivy.process.intermediateevent.AbstractProcessIntermediateEventBean;
import ch.ivyteam.ivy.service.ServiceException;

public abstract class AbstractTestIntermediateEventBean extends AbstractProcessIntermediateEventBean {

  public AbstractTestIntermediateEventBean(String name, String description, Class<?> resultObjectClass) {
    super(name, description, resultObjectClass);
  }

  @Override
  public void start() throws ServiceException {
    super.start();
    printStateChange();
  }

  @Override
  public void stop() throws ServiceException {
    super.stop();
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
