FROM axonivy/axonivy-engine:nightly-11.3

ADD --chown=ivy:ivy docker-ivy-cluster/ivy.yaml /etc/axonivy-engine/ivy.yaml
ADD --chown=ivy:ivy docker-ivy-cluster/log4j2.xml /etc/axonivy-engine/log4j2.xml
ADD --chown=ivy:ivy docker-ivy-cluster/license/cluster-tests.lic /etc/axonivy-engine/license.lic
ADD --chown=ivy:ivy docker-ivy-cluster/info.jsp /usr/lib/axonivy-engine/webapps/system/info.jsp
ADD --chown=ivy:ivy test-app/target/deploy /var/lib/axonivy-engine/deploy
