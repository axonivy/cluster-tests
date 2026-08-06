package ch.ivyteam.ivy.cluster.eventbean;

public class MasterStartEventBean extends AbstractTestStartEventBean {

  public MasterStartEventBean() {
    super("MasterStartEventBean", "The MasterStartEventBean runs only on the master node");
  }
}
