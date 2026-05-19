#!/bin/bash

# Register agent if key is missing
if [ ! -s /var/ossec/etc/client.keys ]; then
    # Use ENV vars with defaults if not set
    MANAGER_IP=${WAZUH_REGISTRATION_SERVER:-host.docker.internal}
    MANAGER_PORT=${WAZUH_REGISTRATION_PORT:-1515}
    
    /var/ossec/bin/agent-auth -m "$MANAGER_IP" -p "$MANAGER_PORT" -d
fi

# Start agent in foreground
echo "Starting Wazuh Agent..."
/var/ossec/bin/wazuh-control start

# Tail logs to keep container alive
tail -f /var/ossec/logs/ossec.log
