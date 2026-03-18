#!/bin/bash

LOCAL_DIR="carpeta_local"
BUCKET_NAME="backup-bcgomez-2026-01"
DATE=$(date +%F)
S3_PATH="s3://$BUCKET_NAME/backups/$DATE/"

echo "Iniciando backup..."
echo "Origen: $LOCAL_DIR"
echo "Destino: $S3_PATH"

if [ ! -d "$LOCAL_DIR" ]; then
  echo "Error: la carpeta no existe"
  exit 1
fi

aws s3 cp "$LOCAL_DIR" "$S3_PATH" --recursive

if [ $? -eq 0 ]; then
  echo "Backup exitoso"
else
  echo "Error en backup"
fi