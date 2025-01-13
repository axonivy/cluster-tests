package ch.ivyteam.ivy.cluster.eventbean;

import ch.ivyteam.ivy.process.beans.IMultiNodeCapable;

public class ClusterIntermediateEventBean extends AbstractTestIntermediateEventBean implements IMultiNodeCapable {

  public ClusterIntermediateEventBean() {
    super("ClusterIntermediateEventBean", "The MasterIntermediateEventBean runs on each cluster node", String.class);
  }
}
