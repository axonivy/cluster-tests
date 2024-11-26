FROM axonivy/axonivy-engine:nightly-12.0

ADD --chown=ivy:ivy docker-ivy-cluster/ivy.yaml /ivy/configuration/ivy.yaml
ADD --chown=ivy:ivy docker-ivy-cluster/log4j2.xml /ivy/configuration/log4j2.xml
ADD --chown=ivy:ivy docker-ivy-cluster/license/cluster-tests.lic /ivy/configuration/license.lic
ADD --chown=ivy:ivy docker-ivy-cluster/info.jsp /ivy/webapps/system/info.jsp
ADD --chown=ivy:ivy test-app/target/deploy /ivy/deploy
