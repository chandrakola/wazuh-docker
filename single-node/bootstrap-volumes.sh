#!/usr/bin/env bash
set -euo pipefail

docker volume inspect wazuh-indexer-data >/dev/null 2>&1 || docker volume create wazuh-indexer-data >/dev/null
