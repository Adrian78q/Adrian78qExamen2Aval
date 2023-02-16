#!/bin/bash
while true; do
    read -p "Introduce el nombre de una ciudad: " ciudad
    grep -i -q "^$ciudad" consumos.txt
    if [ $? -eq 0 ]; then
        consumo_total=$(awk -v ciudad="$ciudad" '$1 == ciudad {sum += $4} END {print sum}' consumos.txt)
        echo "El consumo total de $ciudad es: $consumo_total."
        break
    else
        echo "Ciudad incorrecta. Introduce una ciudad válida."
    fi
done