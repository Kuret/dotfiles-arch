#!/bin/bash

killall polybar || true

for m in $(polybar --list-monitors | cut -d":" -f1); do
    if [ "$m" = "eDP1" ]; then
      MONITOR=$m polybar --reload main &
    else
      MONITOR=$m polybar --reload secondary &
    fi
done

