#!/bin/bash

MAX=80
#MIN=40

for bat in /sys/class/power_supply/BAT*; do
   level=$(< $bat/capacity)
#   [[ $level -le $MIN ]] && grep -iq discharging ${bat}/status && notify-send "Battery under $MIN. Please plug in the adapter"
   [[ $level -gt $MAX ]] && grep -iq ^charging ${bat}/status \
       && notify-send "Battery above $MAX. Please remove the adapter" \
       && paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
done
