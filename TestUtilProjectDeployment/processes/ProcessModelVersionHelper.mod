[Ivy]
[>Created: Tue Jan 25 11:23:09 CET 2011]
12DBC4D60E7D574C 3.15 #module
>Proto >Proto Collection #zClass
pn0 ProcessModelVersionHelper Big #zClass
pn0 B #cInfo
pn0 #process
pn0 @TextInP .resExport .resExport #zField
pn0 @TextInP .type .type #zField
pn0 @TextInP .processKind .processKind #zField
pn0 @AnnotationInP-0n ai ai #zField
pn0 @TextInP .xml .xml #zField
pn0 @TextInP .responsibility .responsibility #zField
pn0 @StartRequest f0 '' #zField
pn0 @EndRequest f1 '' #zField
pn0 @EndRequest f3 '' #zField
pn0 @StartRequest f4 '' #zField
pn0 @StartRequest f6 '' #zField
pn0 @EndRequest f7 '' #zField
pn0 @GridStep f9 '' #zField
pn0 @PushWFArc f2 '' #zField
pn0 @GridStep f11 '' #zField
pn0 @PushWFArc f5 '' #zField
pn0 @GridStep f13 '' #zField
pn0 @PushWFArc f8 '' #zField
pn0 @EndRequest f15 '' #zField
pn0 @Alternative f16 '' #zField
pn0 @PushWFArc f17 '' #zField
pn0 @Alternative f18 '' #zField
pn0 @PushWFArc f19 '' #zField
pn0 @Alternative f20 '' #zField
pn0 @PushWFArc f21 '' #zField
pn0 @PushWFArc f22 '' #zField
pn0 @PushWFArc f14 '' #zField
pn0 @PushWFArc f12 '' #zField
pn0 @PushWFArc f10 '' #zField
pn0 @PushWFArc f23 '' #zField
pn0 @PushWFArc f24 '' #zField
>Proto pn0 pn0 ProcessModelVersionHelper #zField
pn0 f0 outLink activate.ivp #txt
pn0 f0 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f0 inParamDecl '<java.lang.String pm> param;' #txt
pn0 f0 inParamTable 'out.string=param.pm;
' #txt
pn0 f0 actionDecl 'ch.ivyteam.testutilprojectdeployment.Data out;
' #txt
pn0 f0 guid 12DBC4D6A976DE2D #txt
pn0 f0 requestEnabled true #txt
pn0 f0 triggerEnabled false #txt
pn0 f0 callSignature activate(String) #txt
pn0 f0 persist false #txt
pn0 f0 taskData '#
#Tue Jan 25 11:19:30 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
pn0 f0 caseData '#
#Tue Jan 25 11:19:30 CET 2011
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
pn0 f0 showInStartList 1 #txt
pn0 f0 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
pn0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>activate.ivp</name>
    </language>
</elementInfo>
' #txt
pn0 f0 @C|.responsibility Everybody #txt
pn0 f0 131 83 26 26 14 0 #rect
pn0 f0 @|StartRequestIcon #fIcon
pn0 f1 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f1 template "/ProcessPages/ResultText.ivc" #txt
pn0 f1 131 227 26 26 14 0 #rect
pn0 f1 @|EndRequestIcon #fIcon
pn0 f3 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f3 template "/ProcessPages/ResultText.ivc" #txt
pn0 f3 283 227 26 26 14 0 #rect
pn0 f3 @|EndRequestIcon #fIcon
pn0 f4 outLink deactivate.ivp #txt
pn0 f4 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f4 inParamDecl '<java.lang.String pm> param;' #txt
pn0 f4 inParamTable 'out.string=param.pm;
' #txt
pn0 f4 actionDecl 'ch.ivyteam.testutilprojectdeployment.Data out;
' #txt
pn0 f4 guid 12DBC4DACE7BB8EC #txt
pn0 f4 requestEnabled true #txt
pn0 f4 triggerEnabled false #txt
pn0 f4 callSignature deactivate(String) #txt
pn0 f4 persist false #txt
pn0 f4 taskData '#
#Tue Jan 25 11:19:36 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
pn0 f4 caseData '#
#Tue Jan 25 11:19:36 CET 2011
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
pn0 f4 showInStartList 1 #txt
pn0 f4 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
pn0 f4 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>deactivate.ivp</name>
    </language>
</elementInfo>
' #txt
pn0 f4 @C|.responsibility Everybody #txt
pn0 f4 283 83 26 26 14 0 #rect
pn0 f4 @|StartRequestIcon #fIcon
pn0 f6 outLink getActivityState.ivp #txt
pn0 f6 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f6 inParamDecl '<java.lang.String pm> param;' #txt
pn0 f6 inParamTable 'out.string=param.pm;
' #txt
pn0 f6 actionDecl 'ch.ivyteam.testutilprojectdeployment.Data out;
' #txt
pn0 f6 guid 12DBC4DF493ABC05 #txt
pn0 f6 requestEnabled true #txt
pn0 f6 triggerEnabled false #txt
pn0 f6 callSignature getActivityState(String) #txt
pn0 f6 persist false #txt
pn0 f6 taskData '#
#Tue Jan 25 11:20:05 CET 2011
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
pn0 f6 caseData '#
#Tue Jan 25 11:20:05 CET 2011
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
pn0 f6 showInStartList 1 #txt
pn0 f6 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
pn0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>getActivityState.ivp</name>
    </language>
</elementInfo>
' #txt
pn0 f6 @C|.responsibility Everybody #txt
pn0 f6 427 83 26 26 14 0 #rect
pn0 f6 @|StartRequestIcon #fIcon
pn0 f7 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f7 template "/ProcessPages/ResultText.ivc" #txt
pn0 f7 427 227 26 26 14 0 #rect
pn0 f7 @|EndRequestIcon #fIcon
pn0 f9 actionDecl 'ch.ivyteam.testutilprojectdeployment.Data out;
' #txt
pn0 f9 actionTable 'out=in;
' #txt
pn0 f9 actionCode 'in.result = ch.ivyteam.testutilprojectdeployment.ProcessModelVersionHelper.activate(in.string);' #txt
pn0 f9 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f9 126 180 36 24 20 -2 #rect
pn0 f9 @|StepIcon #fIcon
pn0 f2 expr out #txt
pn0 f2 144 204 144 227 #arcP
pn0 f11 actionDecl 'ch.ivyteam.testutilprojectdeployment.Data out;
' #txt
pn0 f11 actionTable 'out=in;
' #txt
pn0 f11 actionCode '
in.result = ch.ivyteam.testutilprojectdeployment.ProcessModelVersionHelper.deactivate(in.string);' #txt
pn0 f11 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f11 278 180 36 24 20 -2 #rect
pn0 f11 @|StepIcon #fIcon
pn0 f5 expr out #txt
pn0 f5 296 204 296 227 #arcP
pn0 f13 actionDecl 'ch.ivyteam.testutilprojectdeployment.Data out;
' #txt
pn0 f13 actionTable 'out=in;
' #txt
pn0 f13 actionCode 'in.result = ch.ivyteam.testutilprojectdeployment.ProcessModelVersionHelper.getActivityState(in.string);' #txt
pn0 f13 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f13 422 180 36 24 20 -2 #rect
pn0 f13 @|StepIcon #fIcon
pn0 f8 expr out #txt
pn0 f8 440 204 440 227 #arcP
pn0 f15 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f15 template "InfoPage.ivc" #txt
pn0 f15 283 275 26 26 14 0 #rect
pn0 f15 @|EndRequestIcon #fIcon
pn0 f16 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f16 130 130 28 28 14 0 #rect
pn0 f16 @|AlternativeIcon #fIcon
pn0 f17 expr out #txt
pn0 f17 144 109 144 130 #arcP
pn0 f18 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f18 282 130 28 28 14 0 #rect
pn0 f18 @|AlternativeIcon #fIcon
pn0 f19 expr out #txt
pn0 f19 296 109 296 130 #arcP
pn0 f20 type ch.ivyteam.testutilprojectdeployment.Data #txt
pn0 f20 426 130 28 28 14 0 #rect
pn0 f20 @|AlternativeIcon #fIcon
pn0 f21 expr out #txt
pn0 f21 440 109 440 130 #arcP
pn0 f22 expr in #txt
pn0 f22 outCond in.string.equalsIgnoreCase("") #txt
pn0 f22 426 144 309 288 #arcP
pn0 f22 1 376 144 #addKink
pn0 f22 2 376 288 #addKink
pn0 f22 1 0.485679950335795 0 0 #arcLabel
pn0 f14 expr in #txt
pn0 f14 outCond in.string.equalsIgnoreCase("") #txt
pn0 f14 282 144 283 288 #arcP
pn0 f14 1 232 144 #addKink
pn0 f14 2 232 288 #addKink
pn0 f14 1 0.42585919860248844 0 0 #arcLabel
pn0 f12 expr in #txt
pn0 f12 outCond in.string.equalsIgnoreCase("") #txt
pn0 f12 158 144 283 288 #arcP
pn0 f12 1 224 144 #addKink
pn0 f12 2 224 288 #addKink
pn0 f12 1 0.1322818918455889 0 0 #arcLabel
pn0 f10 expr in #txt
pn0 f10 144 158 144 180 #arcP
pn0 f23 expr in #txt
pn0 f23 296 158 296 180 #arcP
pn0 f24 expr in #txt
pn0 f24 440 158 440 180 #arcP
>Proto pn0 .type ch.ivyteam.testutilprojectdeployment.Data #txt
>Proto pn0 .processKind NORMAL #txt
>Proto pn0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto pn0 0 0 32 24 18 0 #rect
>Proto pn0 @|BIcon #fIcon
pn0 f9 mainOut f2 tail #connect
pn0 f2 head f1 mainIn #connect
pn0 f11 mainOut f5 tail #connect
pn0 f5 head f3 mainIn #connect
pn0 f13 mainOut f8 tail #connect
pn0 f8 head f7 mainIn #connect
pn0 f0 mainOut f17 tail #connect
pn0 f17 head f16 in #connect
pn0 f4 mainOut f19 tail #connect
pn0 f19 head f18 in #connect
pn0 f6 mainOut f21 tail #connect
pn0 f21 head f20 in #connect
pn0 f20 out f22 tail #connect
pn0 f22 head f15 mainIn #connect
pn0 f18 out f14 tail #connect
pn0 f14 head f15 mainIn #connect
pn0 f16 out f12 tail #connect
pn0 f12 head f15 mainIn #connect
pn0 f16 out f10 tail #connect
pn0 f10 head f9 mainIn #connect
pn0 f18 out f23 tail #connect
pn0 f23 head f11 mainIn #connect
pn0 f20 out f24 tail #connect
pn0 f24 head f13 mainIn #connect
