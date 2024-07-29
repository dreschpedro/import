#!/bin/bash

# Define la carpeta de destino
DESTINATION="$HOME/programas"

# Verifica si la carpeta de destino existe
if [ ! -d "$DESTINATION" ]; then
  echo "La carpeta $DESTINATION no existe. Creándola..."
  mkdir -p "$DESTINATION"
fi

# Lista de URLs para descargar
URLS=(
  "https://example.com/installer1.exe"
  "https://example.com/installer2.exe"
  "https://example.com/installer3.exe"
)

# Descarga cada archivo
for url in "${URLS[@]}"; do
  # Extrae el nombre del archivo de la URL
  filename=$(basename "$url")
  # Descarga el archivo en la carpeta de destino
  echo "Descargando $url..."
  wget -O "$DESTINATION/$filename" "$url"
done

echo "Descargas completas."
