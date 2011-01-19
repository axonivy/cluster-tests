package ch.ivyteam.ivy.cluster.eventbean;


/**
 * @author fs
 */
public class MasterIntermediateEventBean extends AbstractTestIntermediateEventBean {

	/**
	 * 
	 */
	public MasterIntermediateEventBean() {
		super("MasterIntermediateEventBean", "The MasterIntermediateEventBean runs only on the master node", String.class);
	}

}
