#!/bin/bash
if [ -z "$1" ]; then
  echo "Introduce el nombre de una ciudad."
  exit 1
fi
ciudad="$1"
ecoCiudad=$(./cmedia.sh "$media")
if [ $ecoCiudad -gt 400]; then
  echo "$ciudad es ECO"
else
  echo "$ciudad es NO ECO"
fi

