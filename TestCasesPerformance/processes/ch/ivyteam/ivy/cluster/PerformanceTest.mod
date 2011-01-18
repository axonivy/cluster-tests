[Ivy]
[>Created: Tue Jan 18 12:05:59 CET 2011]
127755AEEB3C441C 3.15 #module
>Proto >Proto Collection #zClass
Pt0 PerformanceTest Big #zClass
Pt0 B #cInfo
Pt0 #process
Pt0 @TextInP .resExport .resExport #zField
Pt0 @TextInP .type .type #zField
Pt0 @TextInP .processKind .processKind #zField
Pt0 @AnnotationInP-0n ai ai #zField
Pt0 @MessageFlowInP-0n messageIn messageIn #zField
Pt0 @MessageFlowOutP-0n messageOut messageOut #zField
Pt0 @TextInP .xml .xml #zField
Pt0 @TextInP .responsibility .responsibility #zField
Pt0 @StartRequest f0 '' #zField
Pt0 @Page f3 '' #zField
Pt0 @CallSub f5 '' #zField
Pt0 @GridStep f1 '' #zField
Pt0 @PushWFArc f6 '' #zField
Pt0 @GridStep f8 '' #zField
Pt0 @PushWFArc f9 '' #zField
Pt0 @GridStep f10 '' #zField
Pt0 @Page f13 '' #zField
Pt0 @Alternative f7 '' #zField
Pt0 @PushWFArc f14 '' #zField
Pt0 @PushWFArc f12 '' #zField
Pt0 @Page f15 '' #zField
Pt0 @PushWFArc f16 '' #zField
Pt0 @Alternative f21 '' #zField
Pt0 @GridStep f23 '' #zField
Pt0 @GridStep f26 '' #zField
Pt0 @PushWFArc f27 '' #zField
Pt0 @PushWFArc f2 '' #zField
Pt0 @PushWFArc f22 '' #zField
Pt0 @PushWFArc f4 '' #zField
Pt0 @PushWFArc f25 '' #zField
Pt0 @PushWFArc f11 '' #zField
Pt0 @GridStep f17 '' #zField
Pt0 @PushWFArc f18 '' #zField
Pt0 @PushWFArc f19 '' #zField
Pt0 @EndRequest f20 '' #zField
Pt0 @EndRequest f24 '' #zField
Pt0 @PushWFArc f28 '' #zField
Pt0 @PushWFArc f29 '' #zField
Pt0 @StartRequest f30 '' #zField
Pt0 @GridStep f31 '' #zField
Pt0 @PushWFArc f32 '' #zField
Pt0 @CallSub f33 '' #zField
Pt0 @PushWFArc f34 '' #zField
Pt0 @EndRequest f35 '' #zField
Pt0 @PushWFArc f36 '' #zField
Pt0 @StartRequest f37 '' #zField
Pt0 @EndRequest f40 '' #zField
Pt0 @StartRequest f44 '' #zField
Pt0 @EndTask f45 '' #zField
Pt0 @GridStep f47 '' #zField
Pt0 @PushWFArc f48 '' #zField
Pt0 @PushWFArc f46 '' #zField
Pt0 @GridStep f39 '' #zField
Pt0 @DBStep f43 '' #zField
Pt0 @PushWFArc f50 '' #zField
Pt0 @PushWFArc f42 '' #zField
Pt0 @GridStep f38 '' #zField
Pt0 @PushWFArc f49 '' #zField
Pt0 @PushWFArc f41 '' #zField
>Proto Pt0 Pt0 PerformanceTest #zField
Pt0 f0 outLink systemTasks.ivp #txt
Pt0 f0 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f0 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f0 requestEnabled true #txt
Pt0 f0 triggerEnabled false #txt
Pt0 f0 callSignature systemTasks() #txt
Pt0 f0 persist false #txt
Pt0 f0 startName 'Creates Tasks' #txt
Pt0 f0 taskData '#
#Fri Mar 19 16:45:54 CET 2010
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
.DESC=
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
.NAM=Creates System Tasks
TaskTriggered.EXROL=Everybody
' #txt
Pt0 f0 caseData '#
#Fri Mar 19 16:45:54 CET 2010
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
Pt0 f0 showInStartList 1 #txt
Pt0 f0 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
Pt0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>systemTasks</name>
        <nameStyle>11,5,7,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f0 @C|.responsibility Everybody #txt
Pt0 f0 43 83 26 26 14 0 #rect
Pt0 f0 @|StartRequestIcon #fIcon
Pt0 f3 outTypes "ch.ivyteam.ivy.cluster.PerformanceTest" #txt
Pt0 f3 outLinks "createTasks.ivp" #txt
Pt0 f3 template "taskcreation.ivc" #txt
Pt0 f3 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f3 skipLink skip.ivp #txt
Pt0 f3 sortLink sort.ivp #txt
Pt0 f3 templateWizard '#
#Fri Mar 19 11:35:30 CET 2010
' #txt
Pt0 f3 pageArchivingActivated false #txt
Pt0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
Pt0 f3 @C|.responsibility Everybody #txt
Pt0 f3 150 300 36 24 20 -2 #rect
Pt0 f3 @|PageIcon #fIcon
Pt0 f5 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f5 processCall ch/ivyteam/ivy/cluster/Create:createTasks(ch.ivyteam.ivy.cluster.CreateData) #txt
Pt0 f5 doCall true #txt
Pt0 f5 requestActionDecl '<ch.ivyteam.ivy.cluster.CreateData data> param;
' #txt
Pt0 f5 requestMappingAction 'param.data=in.craete;
' #txt
Pt0 f5 responseActionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f5 responseMappingAction 'out=in;
' #txt
Pt0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>creates system tasks</name>
        <nameStyle>20,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f5 38 404 36 24 20 -2 #rect
Pt0 f5 @|CallSubIcon #fIcon
Pt0 f1 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f1 actionTable 'out=in;
' #txt
Pt0 f1 actionCode 'in.history = null;
in.history.start = System.currentTimeMillis();

' #txt
Pt0 f1 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f1 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start history</name>
        <nameStyle>13,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f1 38 356 36 24 20 -2 #rect
Pt0 f1 @|StepIcon #fIcon
Pt0 f6 expr out #txt
Pt0 f6 56 380 56 404 #arcP
Pt0 f8 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f8 actionTable 'out=in;
' #txt
Pt0 f8 actionCode 'import ch.ivyteam.ivy.cluster.History;

// create history entry if not exists in session 

if (ivy.session.getAttribute("ch.ivyteam.ivy.testcluster.history") != null)
{
	in.histories = ivy.session.getAttribute("ch.ivyteam.ivy.testcluster.history") as List<History>;
}

// update history
in.history.end = System.currentTimeMillis();
in.duration = in.history.end - in.history.start;
in.histories.add(0, in.history);

if (in.histories.size() > 20) {
	in.histories = in.histories.subList(0, 20) as List<History>;
}

ivy.session.setAttribute("ch.ivyteam.ivy.testcluster.history", in.histories);' #txt
Pt0 f8 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f8 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>end history</name>
        <nameStyle>11,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f8 38 452 36 24 20 -2 #rect
Pt0 f8 @|StepIcon #fIcon
Pt0 f9 expr out #txt
Pt0 f9 56 428 56 452 #arcP
Pt0 f9 0 0.6114896700300178 0 0 #arcLabel
Pt0 f10 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f10 actionTable 'out=in;
out.craete.countOfTasks=5;
out.craete.repeat=true;
out.craete.runningSec=900;
out.craete.sqlQuery="SELECT TOP 100 * FROM IWA_CASE";
' #txt
Pt0 f10 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>default values</name>
        <nameStyle>14,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f10 38 188 36 24 20 -2 #rect
Pt0 f10 @|StepIcon #fIcon
Pt0 f13 outTypes "ch.ivyteam.ivy.cluster.PerformanceTest" #txt
Pt0 f13 outLinks "LinkA.ivp" #txt
Pt0 f13 template "endpage.ivc" #txt
Pt0 f13 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f13 skipLink skip.ivp #txt
Pt0 f13 sortLink sort.ivp #txt
Pt0 f13 templateWizard '#
#Fri Mar 19 17:19:51 CET 2010
' #txt
Pt0 f13 pageArchivingActivated false #txt
Pt0 f13 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>repeat</name>
        <nameStyle>6,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f13 @C|.responsibility Everybody #txt
Pt0 f13 38 548 36 24 20 -2 #rect
Pt0 f13 @|PageIcon #fIcon
Pt0 f7 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
Pt0 f7 42 498 28 28 14 0 #rect
Pt0 f7 @|AlternativeIcon #fIcon
Pt0 f14 expr out #txt
Pt0 f14 56 476 56 498 #arcP
Pt0 f12 expr in #txt
Pt0 f12 outCond '(in.startedTime + (1000*in.craete.runningSec)) > System.currentTimeMillis()' #txt
Pt0 f12 56 526 56 548 #arcP
Pt0 f15 outTypes "ch.ivyteam.ivy.cluster.PerformanceTest" #txt
Pt0 f15 outLinks "LinkA.ivp" #txt
Pt0 f15 template "finalpage.ivc" #txt
Pt0 f15 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f15 skipLink skip.ivp #txt
Pt0 f15 sortLink sort.ivp #txt
Pt0 f15 templateWizard '#
#Fri Mar 19 12:46:32 CET 2010
' #txt
Pt0 f15 pageArchivingActivated false #txt
Pt0 f15 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>end page</name>
        <nameStyle>8,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f15 @C|.responsibility Everybody #txt
Pt0 f15 118 500 36 24 20 -2 #rect
Pt0 f15 @|PageIcon #fIcon
Pt0 f16 expr in #txt
Pt0 f16 70 512 118 512 #arcP
Pt0 f21 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f21 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
Pt0 f21 42 298 28 28 14 0 #rect
Pt0 f21 @|AlternativeIcon #fIcon
Pt0 f23 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f23 actionTable 'out=in;
' #txt
Pt0 f23 actionCode 'import ch.ivyteam.ivy.cluster.CreateData;

Object data = ivy.session.getAttribute("ch.ivyteam.ivy.testcluster.createdata");

if (data != null && data instanceof CreateData)
{
	in.craete = data as CreateData;
}
' #txt
Pt0 f23 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f23 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>get config 
from session</name>
        <nameStyle>24,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f23 38 236 36 24 23 -1 #rect
Pt0 f23 @|StepIcon #fIcon
Pt0 f26 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f26 actionTable 'out=in;
' #txt
Pt0 f26 actionCode 'in.startedTime = System.currentTimeMillis();

ivy.session.setAttribute("ch.ivyteam.ivy.testcluster.createdata", in.craete);' #txt
Pt0 f26 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f26 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>set started time</name>
        <nameStyle>16,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f26 150 356 36 24 20 -2 #rect
Pt0 f26 @|StepIcon #fIcon
Pt0 f27 expr data #txt
Pt0 f27 outCond ivp=="createTasks.ivp" #txt
Pt0 f27 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createTasks.ivp</name>
        <nameStyle>15,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f27 168 324 168 356 #arcP
Pt0 f27 0 0.10144927536231885 48 0 #arcLabel
Pt0 f2 expr out #txt
Pt0 f2 150 368 74 368 #arcP
Pt0 f22 expr out #txt
Pt0 f22 56 212 56 236 #arcP
Pt0 f4 expr in #txt
Pt0 f4 56 326 56 356 #arcP
Pt0 f25 expr in #txt
Pt0 f25 outCond !in.repeated #txt
Pt0 f25 70 312 150 312 #arcP
Pt0 f11 expr out #txt
Pt0 f11 56 260 56 298 #arcP
Pt0 f17 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f17 actionTable 'out=in;
' #txt
Pt0 f17 actionCode '
ivy.session.loginSessionUser("user", "user");' #txt
Pt0 f17 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>login as user</name>
        <nameStyle>13,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f17 38 140 36 24 20 -2 #rect
Pt0 f17 @|StepIcon #fIcon
Pt0 f18 expr out #txt
Pt0 f18 56 109 56 140 #arcP
Pt0 f19 expr out #txt
Pt0 f19 56 164 56 188 #arcP
Pt0 f20 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f20 template "" #txt
Pt0 f20 43 603 26 26 14 0 #rect
Pt0 f20 @|EndRequestIcon #fIcon
Pt0 f24 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f24 template "" #txt
Pt0 f24 227 499 26 26 14 0 #rect
Pt0 f24 @|EndRequestIcon #fIcon
Pt0 f28 expr data #txt
Pt0 f28 outCond ivp=="LinkA.ivp" #txt
Pt0 f28 154 512 227 512 #arcP
Pt0 f29 expr data #txt
Pt0 f29 outCond ivp=="LinkA.ivp" #txt
Pt0 f29 56 572 56 603 #arcP
Pt0 f30 outLink createOneTask.ivp #txt
Pt0 f30 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f30 inParamDecl '<> param;' #txt
Pt0 f30 inParamTable 'out.craete.countOfTasks=1;
' #txt
Pt0 f30 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f30 guid 12789E26C96ACFCC #txt
Pt0 f30 requestEnabled true #txt
Pt0 f30 triggerEnabled false #txt
Pt0 f30 callSignature createOneTask() #txt
Pt0 f30 persist false #txt
Pt0 f30 taskData '#
#Tue Mar 23 08:21:43 CET 2010
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
Pt0 f30 caseData '#
#Tue Mar 23 08:21:43 CET 2010
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
Pt0 f30 showInStartList 1 #txt
Pt0 f30 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
Pt0 f30 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createOneTask.ivp</name>
    </language>
</elementInfo>
' #txt
Pt0 f30 @C|.responsibility Everybody #txt
Pt0 f30 675 75 26 26 14 0 #rect
Pt0 f30 @|StartRequestIcon #fIcon
Pt0 f31 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f31 actionTable 'out=in;
' #txt
Pt0 f31 actionCode '
ivy.session.loginSessionUser("user", "user");' #txt
Pt0 f31 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f31 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>login as user</name>
        <nameStyle>13,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f31 670 132 36 24 20 -2 #rect
Pt0 f31 @|StepIcon #fIcon
Pt0 f32 expr out #txt
Pt0 f32 688 101 688 132 #arcP
Pt0 f33 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f33 processCall ch/ivyteam/ivy/cluster/Create:createTasks(ch.ivyteam.ivy.cluster.CreateData) #txt
Pt0 f33 doCall true #txt
Pt0 f33 requestActionDecl '<ch.ivyteam.ivy.cluster.CreateData data> param;
' #txt
Pt0 f33 requestMappingAction 'param.data.countOfTasks=1;
param.data.sqlQuery="";
' #txt
Pt0 f33 responseActionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f33 responseMappingAction 'out=in;
' #txt
Pt0 f33 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createTasks(CreateData)</name>
    </language>
</elementInfo>
' #txt
Pt0 f33 670 188 36 24 20 -2 #rect
Pt0 f33 @|CallSubIcon #fIcon
Pt0 f34 expr out #txt
Pt0 f34 688 156 688 188 #arcP
Pt0 f35 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f35 template "simpleEndPage.ivc" #txt
Pt0 f35 675 251 26 26 14 0 #rect
Pt0 f35 @|EndRequestIcon #fIcon
Pt0 f36 expr out #txt
Pt0 f36 688 212 688 251 #arcP
Pt0 f37 outLink executeSqlQuery.ivp #txt
Pt0 f37 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f37 inParamDecl '<> param;' #txt
Pt0 f37 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f37 guid 12789E6ABE2D0F46 #txt
Pt0 f37 requestEnabled true #txt
Pt0 f37 triggerEnabled false #txt
Pt0 f37 callSignature executeSqlQuery() #txt
Pt0 f37 persist false #txt
Pt0 f37 taskData '#
#Tue Mar 23 11:47:29 CET 2010
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
Pt0 f37 caseData '#
#Tue Mar 23 11:47:29 CET 2010
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
Pt0 f37 showInStartList 1 #txt
Pt0 f37 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
Pt0 f37 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>executeSqlQuery.ivp</name>
        <nameStyle>19,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f37 @C|.responsibility Everybody #txt
Pt0 f37 499 75 26 26 14 0 #rect
Pt0 f37 @|StartRequestIcon #fIcon
Pt0 f40 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f40 template "simpleEndPage.ivc" #txt
Pt0 f40 499 251 26 26 14 0 #rect
Pt0 f40 @|EndRequestIcon #fIcon
Pt0 f44 outLink executeIvyScript.ivp #txt
Pt0 f44 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f44 inParamDecl '<> param;' #txt
Pt0 f44 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f44 guid 12789F90F1369181 #txt
Pt0 f44 requestEnabled true #txt
Pt0 f44 triggerEnabled false #txt
Pt0 f44 callSignature executeIvyScript() #txt
Pt0 f44 persist false #txt
Pt0 f44 taskData '#
#Fri Apr 09 17:47:30 CEST 2010
TaskTriggered.ROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.EXPRI=2
TaskTriggered.TYPE=0
TaskTriggered.PRI=2
TaskTriggered.EXROL=Everybody
' #txt
Pt0 f44 caseData '#
#Fri Apr 09 17:47:30 CEST 2010
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
Pt0 f44 showInStartList 1 #txt
Pt0 f44 taskAndCaseSetupAction 'import ch.ivyteam.ivy.workflow.TaskUpdateDefinition;
ch.ivyteam.ivy.workflow.TaskUpdateDefinition taskUpdDef = new ch.ivyteam.ivy.workflow.TaskUpdateDefinition();taskUpdDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskUpdDef.setExpiryActivator("Everybody");
taskUpdDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
engine.updateCurrentTask(taskUpdDef);
' #txt
Pt0 f44 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>executeIvyScript.ivp</name>
        <nameStyle>20,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f44 @C|.responsibility Everybody #txt
Pt0 f44 323 75 26 26 14 0 #rect
Pt0 f44 @|StartRequestIcon #fIcon
Pt0 f45 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f45 323 251 26 26 14 0 #rect
Pt0 f45 @|EndIcon #fIcon
Pt0 f47 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f47 actionTable 'out=in;
' #txt
Pt0 f47 actionCode 'String str = "start";
for (int i = 0; i < 2000; i++) {
	str = str + i.toString();
}' #txt
Pt0 f47 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f47 318 132 36 24 20 -2 #rect
Pt0 f47 @|StepIcon #fIcon
Pt0 f48 expr out #txt
Pt0 f48 336 101 336 132 #arcP
Pt0 f46 expr out #txt
Pt0 f46 336 156 336 251 #arcP
Pt0 f39 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f39 actionTable 'out=in;
' #txt
Pt0 f39 actionCode 'import ch.ivyteam.ivy.data.cache.IDataCacheGroup;
//ivy.datacache.getApplicationCache().invalidate();


IDataCacheGroup group = ivy.datacache.getApplicationCache().getGroup(in.cacheGroup);
if (#group != null)
{
	ivy.datacache.getApplicationCache().invalidateGroup(group);
}

' #txt
Pt0 f39 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f39 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>invalidate app cache</name>
        <nameStyle>20,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f39 494 164 36 24 20 -2 #rect
Pt0 f39 @|StepIcon #fIcon
Pt0 f43 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f43 actionTable 'out=in;
' #txt
Pt0 f43 dbSql '<?xml version=""1.0"" standalone=""no""?>
<!DOCTYPE ANY_SQL SYSTEM  ""sqlStatements.dtd"">
<ANY_SQL><Verbatim quote=''false''>SELECT TOP 100 * FROM IWA_CASE</Verbatim></ANY_SQL>' #txt
Pt0 f43 dbUrl AnyIvySystemDb #txt
Pt0 f43 cache '{/cache true /invalidation false /scope 1 /groupname "in.cacheGroup"/identifier "\"bubu\""/lifetime_entry "300"/lifetime_group "300"}' #txt
Pt0 f43 dbWizard 'SELECT TOP 100 * FROM IWA_CASE' #txt
Pt0 f43 lotSize 2147483647 #txt
Pt0 f43 startIdx 0 #txt
Pt0 f43 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f43 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>execute db query</name>
        <nameStyle>16,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Pt0 f43 494 204 36 24 20 -2 #rect
Pt0 f43 @|DBStepIcon #fIcon
Pt0 f50 expr out #txt
Pt0 f50 512 188 512 204 #arcP
Pt0 f42 expr out #txt
Pt0 f42 512 228 512 251 #arcP
Pt0 f38 actionDecl 'ch.ivyteam.ivy.cluster.PerformanceTest out;
' #txt
Pt0 f38 actionTable 'out=in;
out.cacheGroup="ch.ivyteam.ivy.cluster.performance-" + (ivy.case.getIdentifier() % 20);
' #txt
Pt0 f38 type ch.ivyteam.ivy.cluster.PerformanceTest #txt
Pt0 f38 494 124 36 24 20 -2 #rect
Pt0 f38 @|StepIcon #fIcon
Pt0 f49 expr out #txt
Pt0 f49 512 101 512 124 #arcP
Pt0 f41 expr out #txt
Pt0 f41 512 148 512 164 #arcP
>Proto Pt0 .type ch.ivyteam.ivy.cluster.PerformanceTest #txt
>Proto Pt0 .processKind NORMAL #txt
>Proto Pt0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Pt0 0 0 32 24 18 0 #rect
>Proto Pt0 @|BIcon #fIcon
Pt0 f1 mainOut f6 tail #connect
Pt0 f6 head f5 mainIn #connect
Pt0 f5 mainOut f9 tail #connect
Pt0 f9 head f8 mainIn #connect
Pt0 f8 mainOut f14 tail #connect
Pt0 f14 head f7 in #connect
Pt0 f7 out f12 tail #connect
Pt0 f12 head f13 mainIn #connect
Pt0 f7 out f16 tail #connect
Pt0 f16 head f15 mainIn #connect
Pt0 f3 out f27 tail #connect
Pt0 f27 head f26 mainIn #connect
Pt0 f26 mainOut f2 tail #connect
Pt0 f2 head f1 mainIn #connect
Pt0 f10 mainOut f22 tail #connect
Pt0 f22 head f23 mainIn #connect
Pt0 f4 head f1 mainIn #connect
Pt0 f21 out f25 tail #connect
Pt0 f25 head f3 mainIn #connect
Pt0 f21 out f4 tail #connect
Pt0 f23 mainOut f11 tail #connect
Pt0 f11 head f21 in #connect
Pt0 f0 mainOut f18 tail #connect
Pt0 f18 head f17 mainIn #connect
Pt0 f17 mainOut f19 tail #connect
Pt0 f19 head f10 mainIn #connect
Pt0 f15 out f28 tail #connect
Pt0 f28 head f24 mainIn #connect
Pt0 f13 out f29 tail #connect
Pt0 f29 head f20 mainIn #connect
Pt0 f30 mainOut f32 tail #connect
Pt0 f32 head f31 mainIn #connect
Pt0 f31 mainOut f34 tail #connect
Pt0 f34 head f33 mainIn #connect
Pt0 f33 mainOut f36 tail #connect
Pt0 f36 head f35 mainIn #connect
Pt0 f44 mainOut f48 tail #connect
Pt0 f48 head f47 mainIn #connect
Pt0 f47 mainOut f46 tail #connect
Pt0 f46 head f45 mainIn #connect
Pt0 f39 mainOut f50 tail #connect
Pt0 f50 head f43 mainIn #connect
Pt0 f43 mainOut f42 tail #connect
Pt0 f42 head f40 mainIn #connect
Pt0 f37 mainOut f49 tail #connect
Pt0 f49 head f38 mainIn #connect
Pt0 f38 mainOut f41 tail #connect
Pt0 f41 head f39 mainIn #connect
