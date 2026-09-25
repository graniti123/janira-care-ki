#!/bin/bash
set -e
DATE=$(date +%Y-%m-%d_%H-%M)
FILE="/opt/janira-care/backup/janira-care-MIGRATION_$DATE.tar.gz"
docker compose -f /opt/janira-care/docker-compose.yml stop
tar --exclude='/opt/janira-care/backup' --exclude='/opt/janira-care/logs' \
    -czf "$FILE" -C /opt janira-care
docker compose -f /opt/janira-care/docker-compose.yml start
echo "Migration-Paket: $FILE"
