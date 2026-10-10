#!/usr/bin/env bash
set -euo pipefail

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time (years): " time

# Validate that all inputs are numeric (integers or decimals).
number_re='^[0-9]+([.][0-9]+)?$'
if [[ ! $principal =~ $number_re || ! $rate =~ $number_re || ! $time =~ $number_re ]]; then
  echo "Error: Please enter non-negative numbers only." >&2
  exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p*r*t)/100 }')
echo "Simple interest: $interest"
