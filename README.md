# Cluster Test Suite

## Setup

```bash
mvn install -f ivy-test-cluster-poject/pom.xml

mvn package -f test-app/pom.xml

docker compose -f docker-ivy-cluster/compose.yml up

mkdir docker-ivy-cluster/apps
curl -X POST http://localhost:9081/ivy/system/api/apps/default/test/deploy/released -u admin:admin -H 'X-Requested-By: curl' -F fileToDeploy=@test-app/target/deploy/test.zip

```
