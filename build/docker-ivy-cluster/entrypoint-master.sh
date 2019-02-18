#!/bin/bash
set -e

bin/EngineConfigCli wait-for-db-server
bin/EngineConfigCli create-db
bin/EngineConfigCli config-cluster

exec bin/AxonIvyEngine
