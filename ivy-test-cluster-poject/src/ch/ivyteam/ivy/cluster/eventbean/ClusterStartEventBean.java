package ch.ivyteam.ivy.cluster.eventbean;

import ch.ivyteam.ivy.process.beans.IMultiNodeCapable;

/**
 * @author fs
 */
public class ClusterStartEventBean extends AbstractTestStartEventBean implements IMultiNodeCapable {

	/**
	 * 
	 */
	public ClusterStartEventBean() 
	{
		super("ClusterStartEventBean", "The ClusterStartEventBean runs on each cluster node");
	}
}
