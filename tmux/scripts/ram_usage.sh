#!/usr/bin/env bash
# Print used/total RAM as e.g. 21.1/48G (macOS).
# Matches btop: active + wired pages.
set -euo pipefail

stats=$(vm_stat)
page_size=$(echo "$stats" | awk '/page size of/ { print $8 }')
active=$(echo "$stats" | awk '/Pages active/ { gsub(/\./, ""); print $3 }')
wired=$(echo "$stats" | awk '/Pages wired down/ { gsub(/\./, ""); print $4 }')
total=$(sysctl -n hw.memsize)

awk -v total="$total" -v active="$active" -v wired="$wired" -v ps="$page_size" 'BEGIN {
  used = (active + wired) * ps
  printf "%.1f/%.0fG", used / 1024 / 1024 / 1024, total / 1024 / 1024 / 1024
}'
