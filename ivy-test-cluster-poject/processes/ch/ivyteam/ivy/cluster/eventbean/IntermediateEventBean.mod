[Ivy]
[>Created: Wed Jan 19 10:48:14 CET 2011]
12D98AB8C2778A4F 3.15 #module
>Proto >Proto Collection #zClass
In0 IntermediateEventBean Big #zClass
In0 B #cInfo
In0 #process
In0 @TextInP .resExport .resExport #zField
In0 @TextInP .type .type #zField
In0 @TextInP .processKind .processKind #zField
In0 @AnnotationInP-0n ai ai #zField
In0 @TextInP .xml .xml #zField
In0 @TextInP .responsibility .responsibility #zField
In0 @InfoButton f6 '' #zField
In0 @StartRequest f0 '' #zField
In0 @StartRequest f1 '' #zField
In0 @EndTask f2 '' #zField
In0 @EndTask f3 '' #zField
In0 @IntermediateEvent f7 '' #zField
In0 @PushWFArc f8 '' #zField
In0 @PushWFArc f5 '' #zField
In0 @IntermediateEvent f9 '' #zField
In0 @PushWFArc f10 '' #zField
In0 @PushWFArc f4 '' #zField
>Proto In0 In0 IntermediateEventBean #zField
In0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>TESTCASE:
* Tests that a MasterStartEventBean runns only on the Master-Node
* Tests that a ClusterStartEventBean runns on each Cluster-Node
* The tests are automatically executed from XY..</name>
        <nameStyle>76,7
112,7
</nameStyle>
    </language>
</elementInfo>
' #txt
In0 f6 458 55 60 114 -1 -31 #rect
In0 f6 @|IBIcon #fIcon
In0 f6 -1|-1|-16777216 #nodeStyle
In0 f0 outLink start.ivp #txt
In0 f0 type performancetest.Data #txt
In0 f0 inParamDecl '<> param;' #txt
In0 f0 actionDecl 'performancetest.Data out;
' #txt
In0 f0 guid 12D98ADD3808E906 #txt
In0 f0 requestEnabled true #txt
In0 f0 triggerEnabled false #txt
In0 f0 callSignature start() #txt
In0 f0 persist false #txt
In0 f0 taskData '#
#Wed Jan 19 10:48:06 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
In0 f0 caseData '#
#Wed Jan 19 10:48:06 CET 2011
businessCreator.user=
businessMilestone.timestamp=
businessObject.code=
businessObject.docDb.code=
businessObject.folder.id=
businessObject.name=
businessPriority=
businessStart.timestamp=
case.description=
case.name=
correspondent.id=
mainContact.docDb.code=
mainContact.folder.id=
mainContact.id=
mainContact.name=
mainContact.type=
process.code=
process.name=
processCategory.code=
processCategory.name=
subType.code=
subType.name=
type.code=
type.name=
' #txt
In0 f0 showInStartList 0 #txt
In0 f0 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
In0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
        <nameStyle>9,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
In0 f0 @C|.responsibility Everybody #txt
In0 f0 67 83 26 26 14 0 #rect
In0 f0 @|StartRequestIcon #fIcon
In0 f1 outLink start2.ivp #txt
In0 f1 type performancetest.Data #txt
In0 f1 inParamDecl '<> param;' #txt
In0 f1 actionDecl 'performancetest.Data out;
' #txt
In0 f1 guid 12D98ADD719DE684 #txt
In0 f1 requestEnabled true #txt
In0 f1 triggerEnabled false #txt
In0 f1 callSignature start2() #txt
In0 f1 persist false #txt
In0 f1 taskData '#
#Wed Jan 19 10:48:12 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
In0 f1 caseData '#
#Wed Jan 19 10:48:12 CET 2011
businessCreator.user=
businessMilestone.timestamp=
businessObject.code=
businessObject.docDb.code=
businessObject.folder.id=
businessObject.name=
businessPriority=
businessStart.timestamp=
case.description=
case.name=
correspondent.id=
mainContact.docDb.code=
mainContact.folder.id=
mainContact.id=
mainContact.name=
mainContact.type=
process.code=
process.name=
processCategory.code=
processCategory.name=
subType.code=
subType.name=
type.code=
type.name=
' #txt
In0 f1 showInStartList 0 #txt
In0 f1 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
In0 f1 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start2.ivp</name>
        <nameStyle>10,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
In0 f1 @C|.responsibility Everybody #txt
In0 f1 291 83 26 26 14 0 #rect
In0 f1 @|StartRequestIcon #fIcon
In0 f2 type performancetest.Data #txt
In0 f2 67 227 26 26 14 0 #rect
In0 f2 @|EndIcon #fIcon
In0 f3 type performancetest.Data #txt
In0 f3 291 235 26 26 14 0 #rect
In0 f3 @|EndIcon #fIcon
In0 f7 actionDecl 'performancetest.Data out;
' #txt
In0 f7 actionTable 'out=in;
' #txt
In0 f7 eventIdConfig '"""fuu bar"""' #txt
In0 f7 timeoutConfig '#
#Wed Jan 19 10:46:33 CET 2011
ACTION_AFTER_TIMEOUT=NOTHING
EXCEPTION_PROCESS_START=
TIMEOUT_SCRIPT=
' #txt
In0 f7 taskData '#
#Wed Jan 19 10:46:33 CET 2011
' #txt
In0 f7 taskAction 'import ch.ivyteam.ivy.workflow.TaskDefinition;
TaskDefinition taskDef;taskDef = new TaskDefinition();
taskDef.setStartRequestPath("TaskA.ivp");
taskDef.setUserFriendlyStartRequestPath("TaskA.ivp");
taskDef.setActivator(TaskDefinition.SYSTEM_USER_NAME);
' #txt
In0 f7 intermediateEventAction 'import ch.ivyteam.ivy.workflow.IntermediateEventDefinition;
import ch.ivyteam.ivy.workflow.IntermediateEventTimeoutAction;
IntermediateEventDefinition eventDef;
eventDef = new IntermediateEventDefinition();
eventDef.setEventIdentifier("fuu bar");
eventDef.setTimeoutAction(IntermediateEventTimeoutAction.NOTHING);
' #txt
In0 f7 outLink TaskA.ivp #txt
In0 f7 type performancetest.Data #txt
In0 f7 eventBeanClass "ch.ivyteam.ivy.cluster.eventbean.MasterIntermediateEventBean" #txt
In0 f7 eventBeanConfig '"#
#Tue Jan 18 11:32:07 CET 2011
demo=
"' #txt
In0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>MasterIntermediateEventBean</name>
        <nameStyle>27,7
</nameStyle>
    </language>
</elementInfo>
' #txt
In0 f7 66 146 28 28 14 0 #rect
In0 f7 @|IntermediateEventIcon #fIcon
In0 f8 expr out #txt
In0 f8 80 109 80 146 #arcP
In0 f5 expr out #txt
In0 f5 80 174 80 227 #arcP
In0 f9 actionDecl 'performancetest.Data out;
' #txt
In0 f9 actionTable 'out=in;
' #txt
In0 f9 eventIdConfig '"""fuu bar"""' #txt
In0 f9 timeoutConfig '#
#Wed Jan 19 10:46:37 CET 2011
ACTION_AFTER_TIMEOUT=NOTHING
EXCEPTION_PROCESS_START=
TIMEOUT_SCRIPT=
' #txt
In0 f9 taskData '#
#Wed Jan 19 10:46:37 CET 2011
' #txt
In0 f9 taskAction 'import ch.ivyteam.ivy.workflow.TaskDefinition;
TaskDefinition taskDef;taskDef = new TaskDefinition();
taskDef.setStartRequestPath("TaskA.ivp");
taskDef.setUserFriendlyStartRequestPath("TaskA.ivp");
taskDef.setActivator(TaskDefinition.SYSTEM_USER_NAME);
' #txt
In0 f9 intermediateEventAction 'import ch.ivyteam.ivy.workflow.IntermediateEventDefinition;
import ch.ivyteam.ivy.workflow.IntermediateEventTimeoutAction;
IntermediateEventDefinition eventDef;
eventDef = new IntermediateEventDefinition();
eventDef.setEventIdentifier("fuu bar");
eventDef.setTimeoutAction(IntermediateEventTimeoutAction.NOTHING);
' #txt
In0 f9 outLink TaskA.ivp #txt
In0 f9 type performancetest.Data #txt
In0 f9 eventBeanClass "ch.ivyteam.ivy.cluster.eventbean.ClusterIntermediateEventBean" #txt
In0 f9 eventBeanConfig '"#
#Tue Jan 18 11:32:07 CET 2011
demo=
"' #txt
In0 f9 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ClusterIntermediateEventBean</name>
        <nameStyle>28,7
</nameStyle>
    </language>
</elementInfo>
' #txt
In0 f9 290 146 28 28 14 0 #rect
In0 f9 @|IntermediateEventIcon #fIcon
In0 f10 expr out #txt
In0 f10 304 109 304 146 #arcP
In0 f4 expr out #txt
In0 f4 304 174 304 235 #arcP
>Proto In0 .type performancetest.Data #txt
>Proto In0 .processKind NORMAL #txt
>Proto In0 0 0 32 24 18 0 #rect
>Proto In0 @|BIcon #fIcon
In0 f0 mainOut f8 tail #connect
In0 f8 head f7 mainIn #connect
In0 f7 mainOut f5 tail #connect
In0 f5 head f2 mainIn #connect
In0 f1 mainOut f10 tail #connect
In0 f10 head f9 mainIn #connect
In0 f9 mainOut f4 tail #connect
In0 f4 head f3 mainIn #connect
