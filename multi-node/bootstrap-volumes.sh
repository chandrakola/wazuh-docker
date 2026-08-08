#!/usr/bin/env bash
set -euo pipefail

for volume in wazuh-indexer-data-1 wazuh-indexer-data-2 wazuh-indexer-data-3; do
  docker volume inspect "$volume" >/dev/null 2>&1 || docker volume create "$volume" >/dev/null
done
