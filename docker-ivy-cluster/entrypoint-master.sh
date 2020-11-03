#!/bin/bash
set -e

bin/EngineConfigCli wait-for-db-server
bin/EngineConfigCli create-db

exec bin/AxonIvyEngine
