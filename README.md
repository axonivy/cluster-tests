# Cluster Test Suite

## Local Development

```bash

# build ivy project
mvn install -f ivy-test-cluster-poject/pom.xml
# build ivy application
mvn package -f test-app/pom.xml

# prepare application directory (mapped as volum)
rm -rf docker-ivy-cluster/apps 
mkdir docker-ivy-cluster/apps

# testing with only two ivy nodes should be enough in general
cp docker-ivy-cluster/2-members.conf dockerivy-cluster/members.conf

# spinupp db loadbalancher and two ivy nodes
docker compose -f docker-ivy-cluster/compose.yml up -d db loadbalancer ivy1 ivy2

# deploy project on one single node
curl -X POST http://localhost:9081/ivy/system/api/apps/default/test/deploy/released -u admin:admin -H 'X-Requested-By: curl' -F fileToDeploy=@test-app/target/deploy/test.zip

# no you can fire request to loadbalancer
http://localhost:9080/ivy/test/pro/ivy-test-cluster-poject/127755AEEB3C441C/executeSqlQuery.ivp
# or to single nodes
http://localhost:9081/ivy/test/pro/ivy-test-cluster-poject/127755AEEB3C441C/executeSqlQuery.ivp
http://localhost:9081/ivy/test/pro/ivy-test-cluster-poject/127755AEEB3C441C/executeSqlQuery.ivp

```
