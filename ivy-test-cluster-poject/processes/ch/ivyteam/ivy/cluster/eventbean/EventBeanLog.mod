[Ivy]
12D992D7A5DD33E0 9.3.0 #module
>Proto >Proto Collection #zClass
Eg0 EventBeanLog Big #zClass
Eg0 B #cInfo
Eg0 #process
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
Eg0 f0 inParamDecl '<String beanName> param;' #txt
Eg0 f0 inParamTable 'out.beanName=param.beanName;
' #txt
Eg0 f0 requestEnabled true #txt
Eg0 f0 triggerEnabled false #txt
Eg0 f0 callSignature getEventBeanLog(String) #txt
Eg0 f0 persist false #txt
Eg0 f0 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Eg0 f0 showInStartList 1 #txt
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
Eg0 f1 template "/ProcessPages/EventBeanLog/output.ivc" #txt
Eg0 f1 147 243 26 26 14 0 #rect
Eg0 f3 outLink clearEventBeanLog.ivp #txt
Eg0 f3 inParamDecl '<String beanName> param;' #txt
Eg0 f3 inParamTable 'out.beanName=param.beanName;
' #txt
Eg0 f3 requestEnabled true #txt
Eg0 f3 triggerEnabled false #txt
Eg0 f3 callSignature clearEventBeanLog(String) #txt
Eg0 f3 persist false #txt
Eg0 f3 taskData 'TaskTriggered.EXPRI=2
TaskTriggered.EXROL=Everybody
TaskTriggered.EXTYPE=0
TaskTriggered.PRI=2
TaskTriggered.ROL=Everybody
TaskTriggered.TYPE=0' #txt
Eg0 f3 showInStartList 1 #txt
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
Eg0 f4 template "/ProcessPages/EventBeanLog/output.ivc" #txt
Eg0 f4 307 243 26 26 14 0 #rect
Eg0 f6 actionTable 'out=in;
' #txt
Eg0 f6 actionCode 'import ch.ivyteam.ivy.cluster.eventbean.ClusterLogger;

ClusterLogger.deleteEventBeanLogAsSystemUser(in.beanName);
in.output = "DONE";' #txt
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
Eg0 f5 expr out #txt
Eg0 f5 320 212 320 243 #arcP
Eg0 f8 actionTable 'out=in;
' #txt
Eg0 f8 actionCode 'import ch.ivyteam.ivy.cluster.eventbean.ClusterLogger;
ivy.session.loginSessionUser("admin","", ivy.task.getIdentifier());

in.output = ClusterLogger.getContentAsSystemUser(in.beanName);' #txt
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
Eg0 f2 expr out #txt
Eg0 f2 160 212 160 243 #arcP
Eg0 f10 146 130 28 28 14 0 #rect
Eg0 f11 expr out #txt
Eg0 f11 160 109 160 130 #arcP
Eg0 f12 template "/ProcessPages/EventBeanLog/infoPage.ivc" #txt
Eg0 f12 227 131 26 26 14 0 #rect
Eg0 f13 expr in #txt
Eg0 f13 outCond in.beanName.equalsIgnoreCase("") #txt
Eg0 f13 174 144 227 144 #arcP
Eg0 f9 expr in #txt
Eg0 f9 160 158 160 188 #arcP
Eg0 f14 306 130 28 28 14 0 #rect
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
