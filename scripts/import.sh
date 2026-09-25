#!/bin/bash
set -e
chown -R root:root /opt/janira-care
chmod +x /opt/janira-care/scripts/*.sh
cd /opt/janira-care && docker compose up -d && sleep 30 && docker compose ps
