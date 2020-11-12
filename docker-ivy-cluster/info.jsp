<%@ page import="ch.ivyteam.ivy.cluster.restricted.IClusterManager"%>
<%@ page import="ch.ivyteam.ivy.cluster.restricted.IClusterNode"%>
<%@ page import="ch.ivyteam.ivy.cluster.restricted.ClusterNodeState"%>
<%@ page import="ch.ivyteam.ivy.cluster.restricted.ClusterNodeCommunicationState"%>
<%@ page import="ch.ivyteam.ivy.application.IApplicationConfigurationManager"%>
<%@ page import="ch.ivyteam.ivy.application.IProcessModelVersion"%>
<%@ page import="ch.ivyteam.ivy.application.ActivityState"%>
<%@ page import="ch.ivyteam.ivy.application.ActivityOperationState"%>
<%@ page import="ch.ivyteam.ivy.application.ReleaseState"%>
<%@ page import="ch.ivyteam.di.restricted.DiCore"%>
<%@ page import="java.lang.management.ManagementFactory"%>
<%@ page import="javax.management.MBeanServer"%>
<%@ page import="javax.management.ObjectName"%>
<%@ page import="java.util.Set"%>
<%@ page import="ch.ivyteam.ivy.service.IServiceManager"%>
<%@ page import="ch.ivyteam.ivy.service.IService"%>
<%@ page import="ch.ivyteam.ivy.service.ServiceState"%>

<html>
<head>
  <title>Axon.ivy Engine Cluster Debug Information</title>
  <style>
	th, td
	{
		border-top: 1px solid;
		text-align: left;
		padding-right: 20px;
	}
	
	.error
	{
		color: red;
		font-weight: bold;
	}
  </style>
</head>
<body>
<h1>Cluster</h1>
<h2>Nodes</h2>
<table>
<thead>
<tr>
<th>Name</th>
<th>State</th>
<th>Communication</th>
<th>Master</th>
<th>Local</th>
<th>Start</th>
<th>Stop</th>
<th>Fail</th>
</tr>
</thead>
<%
 
  IClusterManager manager = DiCore.getGlobalInjector().getInstance(IClusterManager.class);
  for (IClusterNode node : manager.getClusterNodes())
  {
%>
<tbody>
<tr>
<td><%=node.getName()%></td>
<%=node.getState() != ClusterNodeState.RUNNING ? "<td class='error'>":"<td>" %><%=node.getState()%></td>
<%=node.getCommunicationState() != ClusterNodeCommunicationState.UP ? "<td class='error'>":"<td>" %><%=node.getCommunicationState()%></td>
<td><%=node.isMaster()%></td>
<td><%=node.isLocal()%></td>
<td><%=node.getLastStartTimestamp()%></td>
<%=node.getLastStopTimestamp() != null ? "<td class='error'>":"<td>" %><%=node.getLastStopTimestamp()%></td>
<%=node.getLastFailTimestamp() != null ? "<td class='error'>":"<td>" %><%=node.getLastFailTimestamp()%></td>
</tr>  
</tbody>
<%
  }
%>
</table>
<h2>Communication</h2>
<table>
<thead>
<tr>
<th>Sent Messages</th>
<th>Sent Errors</th>
<th>Sent Processing Time [us]</th>
<th>Received Messages</th>
<th>Received Errors</th>
<th>Received Processing Time [us]</th>
<th>Views</th>
</tr>
</thead>
<%
 
  MBeanServer mBeanServer = ManagementFactory.getPlatformMBeanServer();
  ObjectName clusterChannel = new ObjectName("ivy Engine:type=Cluster Channel");
%>
<tbody>
<tr>
<td><%=mBeanServer.getAttribute(clusterChannel, "sendMessages")%></td>
<%
  Long sendErrors = (Long)mBeanServer.getAttribute(clusterChannel, "sendErrors");
%>
<%= sendErrors > 0 ? "<td class='error'>":"<td>" %><%=sendErrors%></td>
<td><%=mBeanServer.getAttribute(clusterChannel, "sendMessagesTotalExecutionTimeInMicroSeconds")%></td>
<td><%=mBeanServer.getAttribute(clusterChannel, "receiveMessages")%></td>
<%
  Long receiveErrors = (Long)mBeanServer.getAttribute(clusterChannel, "receiveErrors");
%>
<%= receiveErrors > 0 ? "<td class='error'>":"<td>" %><%=receiveErrors%></td>
<td><%=mBeanServer.getAttribute(clusterChannel, "receiveMessagesTotalExecutionTimeInMicroSeconds")%></td>
<td><%=mBeanServer.getAttribute(clusterChannel, "views")%></td>
</tr>  
</tbody>
</table>

<h1>Web Server</h1>
<h2>Requests</h2>
<table>
<thead>
<tr>
<th>Protocol</th>
<th>Requests</th>
<th>Errors</th>
<th>Processing Time [ms]</th>
</tr>
</thead>
<%
  Set<ObjectName> requestProcessors = ManagementFactory.getPlatformMBeanServer().queryNames(new ObjectName("ivy:type=GlobalRequestProcessor,name=*"), null);
  for (ObjectName requestProcessor : requestProcessors)
  {
%>
<tbody>
<tr>
<td><%=requestProcessor.getKeyProperty("name")%></td>
<td><%=mBeanServer.getAttribute(requestProcessor, "requestCount")%></td>
<%
  Integer errorCount = (Integer)mBeanServer.getAttribute(requestProcessor, "errorCount");
%>
<%= errorCount > 0 ? "<td class='error'>":"<td>" %><%=errorCount%></td>

<td><%=mBeanServer.getAttribute(requestProcessor, "processingTime")%></td>
</tr>  
</tbody>
<%
  }
%>
</table>

<h2>Sessions</h2>
<table>
<thead>
<tr>
<th>Host</th>
<th>Context</th>
<th>Sessions</th>
</tr>
</thead>
<%
  Set<ObjectName> tomcatManagers = ManagementFactory.getPlatformMBeanServer().queryNames(new ObjectName("ivy:type=Manager,host=*,context=*"), null);
  for (ObjectName tomcatManager : tomcatManagers)
  {
%>
<tbody>
<tr>
<td><%=tomcatManager.getKeyProperty("host")%></td>
<td><%=tomcatManager.getKeyProperty("context")%></td>
<td><%=mBeanServer.getAttribute(tomcatManager, "activeSessions")%></td>
</tr>  
</tbody>
<%
  }
%>
</table>

<h1>Process Model Versions</h1>
<table>
<thead>
<tr>
<th>Name</th>
<th>Application</th>
<th>PM</th>
<th>Activity State</th>
<th>Operation Activity State</th>
<th>Release State</th>
<th>Project</th>
<th>Project URI</th>
</tr>
</thead>
<%
  IApplicationConfigurationManager apps = DiCore.getGlobalInjector().getInstance(IApplicationConfigurationManager.class);
  for (IProcessModelVersion pmv : apps.getProcessModelVersions())
  {
%>
<tbody>
<tr>
<td><%=pmv.getName()%></td>
<td><%=pmv.getApplication().getName()%></td>
<td><%=pmv.getProcessModel().getName()%></td>
<%=pmv.getActivityState() != ActivityState.ACTIVE ? "<td class='error'>":"<td>" %><%=pmv.getActivityState()%></td>
<%=pmv.getActivityOperationState() != ActivityOperationState.ACTIVE ? "<td class='error'>":"<td>" %><%=pmv.getActivityOperationState()%></td>
<%=pmv.getReleaseState() != ReleaseState.RELEASED ? "<td class='error'>":"<td>" %><%=pmv.getReleaseState()%></td>
<%=pmv.getProject() == null ? "<td class='error'>":"<td>" %><%=pmv.getProject()%></td>
<%=pmv.getProjectUri() == null ? "<td class='error'>":"<td>" %><%=pmv.getProjectUri()%></td>
</tr>  
</tbody>
<%
  }
%>
</table>

<h1>Services</h1>
<table>
<thead>
<tr>
<th>Id</th>
<th>State</th>
</tr>
</thead>
<%
  IServiceManager serviceManager = DiCore.getGlobalInjector().getInstance(IServiceManager.class);
  for (IService service : serviceManager.getServices())
  {
%>
<tbody>
<tr>
<td><%=service.getId()%></td>
<%=service.getServiceState() != ServiceState.RUNNING ? "<td class='error'>":"<td>" %><%=service.getServiceState()%></td>
</tr>  
</tbody>
<%
  }
%>
</table>

</body>
</html>
