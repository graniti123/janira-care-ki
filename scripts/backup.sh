#!/bin/bash
set -e
BACKUP_DIR="/opt/janira-care/backup"
DATE=$(date +%Y-%m-%d_%H-%M)
mkdir -p "$BACKUP_DIR"

docker compose -f /opt/janira-care/docker-compose.yml stop
tar -czf "$BACKUP_DIR/open-webui_$DATE.tar.gz" -C /opt/janira-care/data open-webui
tar -czf "$BACKUP_DIR/ollama_$DATE.tar.gz"    -C /opt/janira-care/data ollama
tar -czf "$BACKUP_DIR/wissen_$DATE.tar.gz"    -C /opt/janira-care/wissen .
cp /opt/janira-care/docker-compose.yml "$BACKUP_DIR/compose_$DATE.yml"
cp /opt/janira-care/.env               "$BACKUP_DIR/env_$DATE"
docker compose -f /opt/janira-care/docker-compose.yml start

find "$BACKUP_DIR" -name "*.tar.gz" -mtime +30 -delete
echo "Backup fertig: $DATE"
