#!/bin/bash
set -e
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="/opt/janira-care"

echo "[Janira Care] Installation..."

mkdir -p "$TARGET"/data/{ollama,open-webui,caddy/{data,config}}
mkdir -p "$TARGET"/wissen/{nanda,sgb,krankenkasse,patientenrechte,behindertenrecht,intern}
mkdir -p "$TARGET"/backup "$TARGET"/logs "$TARGET"/branding

cp "$REPO_DIR/docker/docker-compose.yml" "$TARGET/docker-compose.yml"

cat > "$TARGET/data/caddy/Caddyfile" << 'CADDY'
ki.janira-care.de {
    reverse_proxy open-webui:8080
    encode gzip
    header {
        Strict-Transport-Security "max-age=31536000; includeSubDomains"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "SAMEORIGIN"
        -Server
    }
}
CADDY

if [ ! -f "$TARGET/.env" ]; then
  cp "$REPO_DIR/.env.example" "$TARGET/.env"
  SECRET=$(openssl rand -hex 32)
  sed -i "s/HIER_ZUFALLSWERT_EINTRAGEN/$SECRET/" "$TARGET/.env"
  chmod 600 "$TARGET/.env"
fi

cd "$TARGET"
docker compose up -d
sleep 30
docker exec -it janira-ollama ollama pull llama3.2:1b || true
docker exec -it janira-ollama ollama pull nomic-embed-text || true

echo ""
echo "Fertig. Browser: https://ki.janira-care.de"
