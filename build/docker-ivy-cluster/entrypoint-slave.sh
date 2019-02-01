#!/bin/bash
set -e

sleep 30
bin/EngineConfigCli config-cluster

exec bin/AxonIvyEngine
