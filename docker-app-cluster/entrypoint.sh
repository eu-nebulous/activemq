#!/bin/bash
set -e

# Check if the environment variable is set
if [ -z "$ACTIVEMQ_ADMIN_PASSWORD" ]; then
  echo "Error: ACTIVEMQ_ADMIN_PASSWORD is not set."
  exit 1
fi

# Replace placeholder in bootstrap.xml
echo "Replacing \${ACTIVEMQ_ADMIN_PASSWORD} with env var in bootstrap.xml..."
sed -i "s|\${ACTIVEMQ_ADMIN_PASSWORD}|$ACTIVEMQ_ADMIN_PASSWORD|g" /var/lib/artemis-instance/etc-override/bootstrap.xml

# Proceed with normal activemq startup
exec /docker-run.sh run "$@"