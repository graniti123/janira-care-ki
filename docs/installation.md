# Installation

## Voraussetzungen
- Debian 12 / Ubuntu 22.04+
- 8-16 GB RAM
- Docker + Docker Compose
- Domain (z. B. ki.janira-care.de)

## Schritte
1. `sudo ./scripts/install.sh`
2. DNS-A-Record: ki.janira-care.de -> Server-IP
3. Firewall: ufw allow 80,443/tcp
4. Browser: https://ki.janira-care.de
5. Admin-Account anlegen
