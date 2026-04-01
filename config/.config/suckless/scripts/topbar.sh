#!/bin/bash

while true; do
  # ssid=$(iwgetid -r)
  cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
  mem=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
  battery=$(acpi -b | grep -P -o '[0-9]+(?=%)')
  xsetroot -name "CPU: $cpu% | Mem: $mem |Bat: $battery% |Time: $(date +"%H:%M")"
  sleep 5
done &

