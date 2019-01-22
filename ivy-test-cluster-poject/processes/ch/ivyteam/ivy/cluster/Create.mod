[Ivy]
[>Created: Thu Jan 20 09:27:54 CET 2011]
127755F12451D4E4 3.15 #module
>Proto >Proto Collection #zClass
Ce0 Create Big #zClass
Ce0 B #cInfo
Ce0 #process
Ce0 @TextInP .resExport .resExport #zField
Ce0 @TextInP .type .type #zField
Ce0 @TextInP .processKind .processKind #zField
Ce0 @AnnotationInP-0n ai ai #zField
Ce0 @MessageFlowInP-0n messageIn messageIn #zField
Ce0 @MessageFlowOutP-0n messageOut messageOut #zField
Ce0 @TextInP .xml .xml #zField
Ce0 @TextInP .responsibility .responsibility #zField
Ce0 @StartSub f0 '' #zField
Ce0 @EndSub f1 '' #zField
Ce0 @TaskSwitch f5 '' #zField
Ce0 @GridStep f7 '' #zField
Ce0 @PushWFArc f8 '' #zField
Ce0 @Alternative f10 '' #zField
Ce0 @PushWFArc f2 '' #zField
Ce0 @TkArc f3 '' #zField
Ce0 @GridStep f17 '' #zField
Ce0 @PushWFArc f16 '' #zField
Ce0 @GridStep f20 '' #zField
Ce0 @PushWFArc f18 '' #zField
Ce0 @GridStep f6 '' #zField
Ce0 @PushWFArc f9 '' #zField
Ce0 @PushWFArc f11 '' #zField
Ce0 @PushWFArc f4 '' #zField
>Proto Ce0 Ce0 Create #zField
Ce0 f0 inParamDecl '<ch.ivyteam.ivy.cluster.CreateData data> param;' #txt
Ce0 f0 inParamTable 'out=param.data;
out.counter=0;
' #txt
Ce0 f0 outParamDecl '<> result;
' #txt
Ce0 f0 actionDecl 'ch.ivyteam.ivy.cluster.CreateData out;
' #txt
Ce0 f0 callSignature createTasks(ch.ivyteam.ivy.cluster.CreateData) #txt
Ce0 f0 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>createTasks</name>
        <nameStyle>11,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Ce0 f0 139 51 26 26 14 0 #rect
Ce0 f0 @|StartSubIcon #fIcon
Ce0 f1 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f1 67 139 26 26 14 0 #rect
Ce0 f1 @|EndSubIcon #fIcon
Ce0 f5 actionDecl 'ch.ivyteam.ivy.cluster.CreateData out;
' #txt
Ce0 f5 actionTable 'out=in1;
' #txt
Ce0 f5 outTypes "ch.ivyteam.ivy.cluster.CreateData" #txt
Ce0 f5 outLinks "TaskA.ivp" #txt
Ce0 f5 caseData '#
#Thu Jan 20 09:12:25 CET 2011
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
Ce0 f5 taskData '#
#Thu Jan 20 09:12:25 CET 2011
TaskA.BIZMSTS=new DateTime()
TaskA.EXPRI=2
TaskA.EXROL=Everybody
TaskA.EXTYPE=0
TaskA.NAM=System Task <%\=in1.counter%> of <%\=in1.countOfTasks%>
TaskA.PRI=2
TaskA.ROL=SELF1
TaskA.TYPE=1
TaskA.customFields.varchar.1="task custom value from " + new Date()
' #txt
Ce0 f5 taskAction 'import ch.ivyteam.ivy.workflow.TaskDefinition;
List<TaskDefinition> taskDefinitions;
TaskDefinition taskDef;taskDef = new TaskDefinition();
taskDef.setStartRequestPath("TaskA.ivp");
taskDef.setName(engine.expandMacros("System Task <%=in1.counter%> of <%=in1.countOfTasks%>"));
taskDef.setBusinessMilestoneTimestamp(new DateTime());
taskDef.setAutoStartTask(true);
taskDef.setActivator("SELF1");
taskDef.setPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskDef.setExpiryActivator("Everybody");
taskDef.setExpiryPriority(ch.ivyteam.ivy.workflow.WorkflowPriority.valueOf(2));
taskDef.setCustomVarCharField1("task custom value from " + new Date());
taskDefinitions.add(taskDef);
' #txt
Ce0 f5 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f5 template "" #txt
Ce0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>create self task</name>
        <nameStyle>16,7,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Ce0 f5 138 186 28 28 14 0 #rect
Ce0 f5 @|TaskSwitchIcon #fIcon
Ce0 f7 actionDecl 'ch.ivyteam.ivy.cluster.CreateData out;
' #txt
Ce0 f7 actionTable 'out=in;
out.counter=in.counter+1;
' #txt
Ce0 f7 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f7 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>counter +1</name>
        <nameStyle>10,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Ce0 f7 134 236 36 24 20 -2 #rect
Ce0 f7 @|StepIcon #fIcon
Ce0 f8 expr data #txt
Ce0 f8 outCond ivp=="TaskA.ivp" #txt
Ce0 f8 152 214 152 236 #arcP
Ce0 f10 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f10 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
Ce0 f10 138 138 28 28 14 0 #rect
Ce0 f10 @|AlternativeIcon #fIcon
Ce0 f2 expr in #txt
Ce0 f2 138 152 93 152 #arcP
Ce0 f3 expr in #txt
Ce0 f3 outCond 'in.counter < in.countOfTasks' #txt
Ce0 f3 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f3 var in1 #txt
Ce0 f3 152 166 152 186 #arcP
Ce0 f17 actionDecl 'ch.ivyteam.ivy.cluster.CreateData out;
' #txt
Ce0 f17 actionTable 'out=in;
' #txt
Ce0 f17 actionCode '//ivy.case.setBusinessMilestoneTimestamp(new Date());
//ivy.case.setCustomVarCharField1("case custom value from " + new Date());

//ivy.task.setBusinessMilestoneTimestamp(new Date());
//ivy.task.setCustomVarCharField1("task custom value from " + new Date());' #txt
Ce0 f17 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f17 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>update task/case</name>
        <nameStyle>16,7,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Ce0 f17 134 332 36 24 20 -2 #rect
Ce0 f17 @|StepIcon #fIcon
Ce0 f16 expr out #txt
Ce0 f16 152 356 166 152 #arcP
Ce0 f16 1 152 384 #addKink
Ce0 f16 2 448 384 #addKink
Ce0 f16 3 448 152 #addKink
Ce0 f16 2 0.7428531861109842 0 0 #arcLabel
Ce0 f20 actionDecl 'ch.ivyteam.ivy.cluster.CreateData out;
' #txt
Ce0 f20 actionTable 'out=in;
' #txt
Ce0 f20 actionCode 'for (int i = 0; i < 2; i++) {
	ivy.task.createNote(ivy.session, 
	 	  "Add note " + i + " for case " + ivy.case.getIdentifier() 
	  + " and task " + ivy.task.getIdentifier());
	
}
' #txt
Ce0 f20 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f20 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>add 2 notes</name>
        <nameStyle>11,9
</nameStyle>
    </language>
</elementInfo>
' #txt
Ce0 f20 134 284 36 24 20 -2 #rect
Ce0 f20 @|StepIcon #fIcon
Ce0 f18 expr out #txt
Ce0 f18 152 308 152 332 #arcP
Ce0 f6 actionDecl 'ch.ivyteam.ivy.cluster.CreateData out;
' #txt
Ce0 f6 actionTable 'out=in;
out.counter=0;
' #txt
Ce0 f6 type ch.ivyteam.ivy.cluster.CreateData #txt
Ce0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
Ce0 f6 134 92 36 24 20 -2 #rect
Ce0 f6 @|StepIcon #fIcon
Ce0 f9 expr out #txt
Ce0 f9 152 77 152 92 #arcP
Ce0 f11 expr out #txt
Ce0 f11 152 116 152 138 #arcP
Ce0 f4 expr out #txt
Ce0 f4 152 260 152 284 #arcP
>Proto Ce0 .type ch.ivyteam.ivy.cluster.CreateData #txt
>Proto Ce0 .processKind CALLABLE_SUB #txt
>Proto Ce0 0 0 32 24 18 0 #rect
>Proto Ce0 @|BIcon #fIcon
Ce0 f5 out f8 tail #connect
Ce0 f8 head f7 mainIn #connect
Ce0 f2 head f1 mainIn #connect
Ce0 f10 out f3 tail #connect
Ce0 f3 head f5 in #connect
Ce0 f10 out f2 tail #connect
Ce0 f17 mainOut f16 tail #connect
Ce0 f16 head f10 in #connect
Ce0 f20 mainOut f18 tail #connect
Ce0 f18 head f17 mainIn #connect
Ce0 f0 mainOut f9 tail #connect
Ce0 f9 head f6 mainIn #connect
Ce0 f6 mainOut f11 tail #connect
Ce0 f11 head f10 in #connect
Ce0 f7 mainOut f4 tail #connect
Ce0 f4 head f20 mainIn #connect
