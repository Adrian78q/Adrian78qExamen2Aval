#!/bin/bash
for ciudad in Valencia Madrid Barcelona; do
  echo "$ciudad $(./cmedia.sh $ciudad)"
done | awk '{if (NR==1 || $2<min) {min=$2; min_ciudad=$1}} END {print min_ciudad}'
