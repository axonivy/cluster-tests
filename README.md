# Cluster Test Suite

## Setup

```bash
mvn package -f test-app/pom.xml
docker build -t axonivy-engine-cluster-test -f docker-ivy-cluster/Dockerfile .

docker compose -f docker-ivy-cluster/compose.yml up
```
