#!/bin/bash
set -e

# Check if the environment variable is set
if [ -z "$ACTIVEMQ_ADMIN_PASSWORD" ]; then
  echo "Error: ACTIVEMQ_ADMIN_PASSWORD is not set."
  exit 1
fi

# Replace placeholder in artemis-users.properties
echo "Replacing \${ACTIVEMQ_ADMIN_PASSWORD}  with env var in artemis-users.properties..."
sed -i "s|\${ACTIVEMQ_ADMIN_PASSWORD}|$ACTIVEMQ_ADMIN_PASSWORD|g" /var/lib/artemis-instance/etc-override/artemis-users.properties
# Proceed with normal activemq startup
echo "Replacing \${ACTIVEMQ_APP_CLIENT_PASSWORD} with env var in artemis-users.properties..."
sed -i "s|\${ACTIVEMQ_APP_CLIENT_PASSWORD}|$ACTIVEMQ_APP_CLIENT_PASSWORD|g" /var/lib/artemis-instance/etc-override/artemis-users.properties
exec /docker-run.sh run "$@"