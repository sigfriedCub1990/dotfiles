#!/bin/bash

killall polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mybar | tee -a /tmp/polybar.log & disown &
  done
else
    polybar --reload mybar | tee -a /tmp/polybar.log & disown &
fi

;vim:ft=sh
