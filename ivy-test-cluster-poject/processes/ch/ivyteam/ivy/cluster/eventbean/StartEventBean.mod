[Ivy]
[>Created: Wed Jan 19 10:46:51 CET 2011]
12D9878DD11AB6B3 3.15 #module
>Proto >Proto Collection #zClass
Sn0 StartEventBean Big #zClass
Sn0 B #cInfo
Sn0 #process
Sn0 @TextInP .resExport .resExport #zField
Sn0 @TextInP .type .type #zField
Sn0 @TextInP .processKind .processKind #zField
Sn0 @AnnotationInP-0n ai ai #zField
Sn0 @TextInP .xml .xml #zField
Sn0 @TextInP .responsibility .responsibility #zField
Sn0 @StartEvent f0 '' #zField
Sn0 @EndTask f1 '' #zField
Sn0 @PushWFArc f2 '' #zField
Sn0 @StartEvent f3 '' #zField
Sn0 @EndTask f4 '' #zField
Sn0 @PushWFArc f5 '' #zField
Sn0 @InfoButton f6 '' #zField
>Proto Sn0 Sn0 StartEventBean #zField
Sn0 f0 outerBean "ch.ivyteam.ivy.cluster.eventbean.MasterStartEventBean" #txt
Sn0 f0 beanConfig '"#
#Tue Jan 18 10:34:56 CET 2011
demo=
"' #txt
Sn0 f0 outLink eventLink.ivp #txt
Sn0 f0 type performancetest.Data #txt
Sn0 f0 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>MasterStartEventBean</name>
        <nameStyle>20,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Sn0 f0 @C|.responsibility Everybody #txt
Sn0 f0 67 75 26 26 14 0 #rect
Sn0 f0 @|StartEventIcon #fIcon
Sn0 f1 type performancetest.Data #txt
Sn0 f1 67 179 26 26 14 0 #rect
Sn0 f1 @|EndIcon #fIcon
Sn0 f2 expr out #txt
Sn0 f2 80 101 80 179 #arcP
Sn0 f3 outerBean "ch.ivyteam.ivy.cluster.eventbean.ClusterStartEventBean" #txt
Sn0 f3 beanConfig '"#
#Tue Jan 18 10:34:56 CET 2011
demo=
"' #txt
Sn0 f3 outLink eventLink2.ivp #txt
Sn0 f3 type performancetest.Data #txt
Sn0 f3 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<elementInfo>
    <language>
        <name>ClusterStartEventBean</name>
        <nameStyle>21,7
</nameStyle>
    </language>
</elementInfo>
' #txt
Sn0 f3 @C|.responsibility Everybody #txt
Sn0 f3 251 75 26 26 14 0 #rect
Sn0 f3 @|StartEventIcon #fIcon
Sn0 f4 type performancetest.Data #txt
Sn0 f4 251 179 26 26 14 0 #rect
Sn0 f4 @|EndIcon #fIcon
Sn0 f5 expr out #txt
Sn0 f5 264 101 264 179 #arcP
Sn0 f6 @C|.xml '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
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
Sn0 f6 442 39 60 114 -1 -31 #rect
Sn0 f6 @|IBIcon #fIcon
Sn0 f6 -1|-1|-16777216 #nodeStyle
>Proto Sn0 .type performancetest.Data #txt
>Proto Sn0 .processKind NORMAL #txt
>Proto Sn0 0 0 32 24 18 0 #rect
>Proto Sn0 @|BIcon #fIcon
Sn0 f0 mainOut f2 tail #connect
Sn0 f2 head f1 mainIn #connect
Sn0 f3 mainOut f5 tail #connect
Sn0 f5 head f4 mainIn #connect
