#!/bin/bash
set -e
cd /opt/janira-care
docker compose pull
docker compose up -d
docker image prune -f
echo "Update fertig."
