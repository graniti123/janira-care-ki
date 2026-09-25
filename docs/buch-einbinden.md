# Wissensbasis einbinden

Wichtig: Das NANDA-I-Buch ist urheberrechtlich geschuetzt.
Es darf NICHT ins oeffentliche Repo.

## 1. PDFs auf Server kopieren
scp ./nanda-buch.pdf root@server:/opt/janira-care/wissen/nanda/

## 2. OCR bei Scans
apt install -y ocrmypdf tesseract-ocr-deu
ocrmypdf --language deu input.pdf output.pdf

## 3. In Open WebUI
- Workspace -> Knowledge -> Create
- Name: janira-wissen
- Embedding: nomic-embed-text
- PDFs hochladen

## 4. Modell verknuepfen
- Workspace -> Models -> Create
- Name: Janira Care KI-Assistent
- Base: llama3.2:1b
- Knowledge: janira-wissen
- System-Prompt aus docs/system-prompt.md einfuegen
