# Betrieb

## Start / Stop
sudo ./scripts/start.sh
sudo ./scripts/stop.sh

## Update
sudo ./scripts/update.sh

## Backup (taeglich per Cron)
0 3 * * * /opt/janira-care/scripts/backup.sh >> /opt/janira-care/logs/backup.log 2>&1
