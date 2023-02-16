#!/bin/bash
if [ $# -ne 1 ]; then
  echo "USO: $0 <ciudad>"
  exit 1
fi
ciudad=$1
consumos="consumos.txt"
if ! grep -q "^$ciudad " "$consumos"; then
  echo "ciudad $ciudad not found in $consumos"
  exit 1
fi
min_consumo=$(grep "^$ciudad " "$consumos" | awk '{print $4}' | sort -n | head -n 1)
max_consumo=$(grep "^$ciudad " "$consumos" | awk '{print $4}' | sort -nr | head -n 1)
echo "Ciudad: $ciudad"
echo "Consumo minimo: $(grep "^$ciudad .* $min_consumo$" "$consumos" | awk '{print $2, $3}')"
echo "Consumo maximo: $(grep "^$ciudad .* $max_consumo$" "$consumos" | awk '{print $2, $3}')"
