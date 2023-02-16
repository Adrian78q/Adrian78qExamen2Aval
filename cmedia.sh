#!/bin/bash
if [ -z "$1" ]; then
  echo "Introduce el nombre de una ciudad."
  exit 1
fi
ciudad="$1"
consumos=$(grep -E "^${ciudad}\s" consumos.txt | awk '{print $4}')
if [ -z "$consumos" ]; then
  echo "No se han encontrado consumos en ${ciudad}."
  exit 1
fi
media=$(echo "$consumos" | awk '{sum += $1} END {print sum/NR}')
echo "La media de consumos de la ciudad ${ciudad} es: ${media}"
