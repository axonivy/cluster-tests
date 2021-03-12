[Ivy]
12D851E10A821416 9.2.0 #module
>Proto >Proto Collection #zClass
Rk0 ResumeTask Big #zClass
Rk0 B #cInfo
Rk0 #process
Rk0 @TextInP .type .type #zField
Rk0 @TextInP .processKind .processKind #zField
Rk0 @AnnotationInP-0n ai ai #zField
Rk0 @TextInP .xml .xml #zField
Rk0 @TextInP .responsibility .responsibility #zField
Rk0 @StartRequest f0 '' #zField
Rk0 @GridStep f1 '' #zField
Rk0 @PushWFArc f2 '' #zField
Rk0 @EndRequest f3 '' #zField
Rk0 @PushWFArc f4 '' #zField
Rk0 @StartRequest f5 '' #zField
Rk0 @GridStep f6 '' #zField
Rk0 @PushWFArc f7 '' #zField
Rk0 @TaskSwitch f8 '' #zField
Rk0 @TkArc f9 '' #zField
Rk0 @PushWFArc f10 '' #zField
>Proto Rk0 Rk0 ResumeTask #zField
Rk0 f0 outLink start.ivp #txt
Rk0 f0 inParamDecl '<> param;' #txt
Rk0 f0 requestEnabled true #txt
Rk0 f0 triggerEnabled false #txt
Rk0 f0 callSignature start() #txt
Rk0 f0 persist false #txt
Rk0 f0 startName 'Login and get task uri' #txt
Rk0 f0 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Rk0 f0 showInStartList 1 #txt
Rk0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start.ivp</name>
        <nameStyle>9,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Rk0 f0 @C|.responsibility Everybody #txt
Rk0 f0 43 43 26 26 14 0 #rect
Rk0 f1 actionTable 'out=in;
' #txt
Rk0 f1 actionCode 'import ch.ivyteam.ivy.request.IHttpRequest;
import ch.ivyteam.ivy.request.RequestUriFactory;
import ch.ivyteam.ivy.workflow.ITask;
// login
ivy.session.loginSessionUser("user", "user", ivy.task.getIdentifier());
// get first task to start
List<ITask> tasks = ivy.session.findSuspendedWorkTasks(0, 1);
in.taskStartUri = RequestUriFactory.createServerUri(ivy.request as IHttpRequest).resolve(
									RequestUriFactory.createTaskStartUri(ivy.request as IHttpRequest, tasks.get(0))).toASCIIString();' #txt
Rk0 f1 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>login / get task start uri</name>
        <nameStyle>26,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Rk0 f1 38 108 36 24 20 -2 #rect
Rk0 f2 expr out #txt
Rk0 f2 56 69 56 108 #arcP
Rk0 f3 template "/ProcessPages/ResumeTask/Page.ivc" #txt
Rk0 f3 43 171 26 26 14 0 #rect
Rk0 f4 expr out #txt
Rk0 f4 56 132 56 171 #arcP
Rk0 f5 outLink start2.ivp #txt
Rk0 f5 inParamDecl '<> param;' #txt
Rk0 f5 requestEnabled true #txt
Rk0 f5 triggerEnabled false #txt
Rk0 f5 callSignature start2() #txt
Rk0 f5 persist false #txt
Rk0 f5 startName 'Start Task' #txt
Rk0 f5 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Rk0 f5 showInStartList 1 #txt
Rk0 f5 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>start2.ivp</name>
        <nameStyle>10,5,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Rk0 f5 @C|.responsibility Everybody #txt
Rk0 f5 227 43 26 26 14 0 #rect
Rk0 f6 actionTable 'out=in;
' #txt
Rk0 f6 222 92 36 24 20 -2 #rect
Rk0 f7 expr out #txt
Rk0 f7 240 69 240 92 #arcP
Rk0 f8 actionTable 'out=in1;
' #txt
Rk0 f8 outLinks "TaskA.ivp" #txt
Rk0 f8 template "" #txt
Rk0 f8 226 138 28 28 14 0 #rect
Rk0 f9 expr out #txt
Rk0 f9 type ch.ivyteam.ivy.cluster.ResumeTask #txt
Rk0 f9 var in1 #txt
Rk0 f9 240 116 240 138 #arcP
Rk0 f10 expr data #txt
Rk0 f10 outCond ivp=="TaskA.ivp" #txt
Rk0 f10 254 152 258 104 #arcP
Rk0 f10 1 304 152 #addKink
Rk0 f10 2 304 104 #addKink
Rk0 f10 1 0.4583333333333333 0 0 #arcLabel
>Proto Rk0 .type ch.ivyteam.ivy.cluster.ResumeTask #txt
>Proto Rk0 .processKind NORMAL #txt
>Proto Rk0 .xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language/>
</elementInfo>
' #txt
>Proto Rk0 0 0 32 24 18 0 #rect
>Proto Rk0 @|BIcon #fIcon
Rk0 f0 mainOut f2 tail #connect
Rk0 f2 head f1 mainIn #connect
Rk0 f1 mainOut f4 tail #connect
Rk0 f4 head f3 mainIn #connect
Rk0 f5 mainOut f7 tail #connect
Rk0 f7 head f6 mainIn #connect
Rk0 f6 mainOut f9 tail #connect
Rk0 f9 head f8 in #connect
Rk0 f8 out f10 tail #connect
Rk0 f10 head f6 mainIn #connect
