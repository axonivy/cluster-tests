[Ivy]
[>Created: Thu Jan 20 17:37:42 CET 2011]
12D992D7A5DD33E0 3.15 #module
>Proto >Proto Collection #zClass
Eg0 EventBeanLog Big #zClass
Eg0 B #cInfo
Eg0 #process
Eg0 @TextInP .resExport .resExport #zField
Eg0 @TextInP .type .type #zField
Eg0 @TextInP .processKind .processKind #zField
Eg0 @AnnotationInP-0n ai ai #zField
Eg0 @TextInP .xml .xml #zField
Eg0 @TextInP .responsibility .responsibility #zField
Eg0 @StartRequest f0 '' #zField
Eg0 @EndRequest f1 '' #zField
Eg0 @StartRequest f3 '' #zField
Eg0 @EndRequest f4 '' #zField
Eg0 @GridStep f6 '' #zField
Eg0 @PushWFArc f5 '' #zField
Eg0 @GridStep f8 '' #zField
Eg0 @PushWFArc f2 '' #zField
Eg0 @Alternative f10 '' #zField
Eg0 @PushWFArc f11 '' #zField
Eg0 @EndRequest f12 '' #zField
Eg0 @PushWFArc f13 '' #zField
Eg0 @PushWFArc f9 '' #zField
Eg0 @Alternative f14 '' #zField
Eg0 @PushWFArc f15 '' #zField
Eg0 @PushWFArc f16 '' #zField
Eg0 @PushWFArc f7 '' #zField
>Proto Eg0 Eg0 EventBeanLog #zField
Eg0 f0 outLink getEventBeanLog.ivp #txt
Eg0 f0 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f0 inParamDecl '<java.lang.String beanName> param;' #txt
Eg0 f0 inParamTable 'out.beanName=param.beanName;
' #txt
Eg0 f0 actionDecl 'ch.ivyteam.ivy.cluster.eventbean.EventBeanTests out;
' #txt
Eg0 f0 guid 12D992D87145D5F3 #txt
Eg0 f0 requestEnabled true #txt
Eg0 f0 triggerEnabled false #txt
Eg0 f0 callSignature getEventBeanLog(String) #txt
Eg0 f0 persist false #txt
Eg0 f0 taskData '#
#Thu Jan 20 17:34:19 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
Eg0 f0 caseData '#
#Thu Jan 20 17:34:19 CET 2011
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
Eg0 f0 showInStartList 1 #txt
Eg0 f0 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
Eg0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>getEventBeanLog.ivp</name>
        <nameStyle>19,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Eg0 f0 @C|.responsibility Everybody #txt
Eg0 f0 147 83 26 26 14 0 #rect
Eg0 f0 @|StartRequestIcon #fIcon
Eg0 f1 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f1 template "/ProcessPages/EventBeanLog/output.ivc" #txt
Eg0 f1 147 243 26 26 14 0 #rect
Eg0 f1 @|EndRequestIcon #fIcon
Eg0 f3 outLink clearEventBeanLog.ivp #txt
Eg0 f3 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f3 inParamDecl '<java.lang.String beanName> param;' #txt
Eg0 f3 inParamTable 'out.beanName=param.beanName;
' #txt
Eg0 f3 actionDecl 'ch.ivyteam.ivy.cluster.eventbean.EventBeanTests out;
' #txt
Eg0 f3 guid 12D992DA5F63B1FA #txt
Eg0 f3 requestEnabled true #txt
Eg0 f3 triggerEnabled false #txt
Eg0 f3 callSignature clearEventBeanLog(String) #txt
Eg0 f3 persist false #txt
Eg0 f3 taskData '#
#Thu Jan 20 17:37:35 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
Eg0 f3 caseData '#
#Thu Jan 20 17:37:35 CET 2011
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
Eg0 f3 showInStartList 1 #txt
Eg0 f3 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
Eg0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>clearEventBeanLog.ivp</name>
        <nameStyle>21,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Eg0 f3 @C|.responsibility Everybody #txt
Eg0 f3 307 83 26 26 14 0 #rect
Eg0 f3 @|StartRequestIcon #fIcon
Eg0 f4 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f4 template "/ProcessPages/EventBeanLog/output.ivc" #txt
Eg0 f4 307 243 26 26 14 0 #rect
Eg0 f4 @|EndRequestIcon #fIcon
Eg0 f6 actionDecl 'ch.ivyteam.ivy.cluster.eventbean.EventBeanTests out;
' #txt
Eg0 f6 actionTable 'out=in;
' #txt
Eg0 f6 actionCode 'import ch.ivyteam.ivy.cluster.eventbean.ClusterLogger;

ClusterLogger.deleteEventBeanLogAsSystemUser(in.beanName);
in.output = "DONE";' #txt
Eg0 f6 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>delete log file</name>
        <nameStyle>15,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Eg0 f6 302 188 36 24 20 -2 #rect
Eg0 f6 @|StepIcon #fIcon
Eg0 f5 expr out #txt
Eg0 f5 320 212 320 243 #arcP
Eg0 f8 actionDecl 'ch.ivyteam.ivy.cluster.eventbean.EventBeanTests out;
' #txt
Eg0 f8 actionTable 'out=in;
' #txt
Eg0 f8 actionCode 'import ch.ivyteam.ivy.cluster.eventbean.ClusterLogger;
ivy.session.loginSessionUser("admin","", ivy.task.getIdentifier());

in.output = ClusterLogger.getContentAsSystemUser(in.beanName);' #txt
Eg0 f8 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>get content</name>
        <nameStyle>11,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Eg0 f8 142 188 36 24 20 -2 #rect
Eg0 f8 @|StepIcon #fIcon
Eg0 f2 expr out #txt
Eg0 f2 160 212 160 243 #arcP
Eg0 f10 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f10 146 130 28 28 14 0 #rect
Eg0 f10 @|AlternativeIcon #fIcon
Eg0 f11 expr out #txt
Eg0 f11 160 109 160 130 #arcP
Eg0 f12 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f12 template "infoPage.ivc" #txt
Eg0 f12 227 131 26 26 14 0 #rect
Eg0 f12 @|EndRequestIcon #fIcon
Eg0 f13 expr in #txt
Eg0 f13 outCond in.beanName.equalsIgnoreCase("") #txt
Eg0 f13 174 144 227 144 #arcP
Eg0 f9 expr in #txt
Eg0 f9 160 158 160 188 #arcP
Eg0 f14 type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
Eg0 f14 306 130 28 28 14 0 #rect
Eg0 f14 @|AlternativeIcon #fIcon
Eg0 f15 expr out #txt
Eg0 f15 320 109 320 130 #arcP
Eg0 f16 expr in #txt
Eg0 f16 outCond in.beanName.equalsIgnoreCase("") #txt
Eg0 f16 306 144 253 144 #arcP
Eg0 f7 expr in #txt
Eg0 f7 320 158 320 188 #arcP
>Proto Eg0 .type ch.ivyteam.ivy.cluster.eventbean.EventBeanTests #txt
>Proto Eg0 .processKind NORMAL #txt
>Proto Eg0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Eg0 0 0 32 24 18 0 #rect
>Proto Eg0 @|BIcon #fIcon
Eg0 f6 mainOut f5 tail #connect
Eg0 f5 head f4 mainIn #connect
Eg0 f8 mainOut f2 tail #connect
Eg0 f2 head f1 mainIn #connect
Eg0 f0 mainOut f11 tail #connect
Eg0 f11 head f10 in #connect
Eg0 f10 out f13 tail #connect
Eg0 f13 head f12 mainIn #connect
Eg0 f10 out f9 tail #connect
Eg0 f9 head f8 mainIn #connect
Eg0 f3 mainOut f15 tail #connect
Eg0 f15 head f14 in #connect
Eg0 f14 out f16 tail #connect
Eg0 f16 head f12 mainIn #connect
Eg0 f14 out f7 tail #connect
Eg0 f7 head f6 mainIn #connect
