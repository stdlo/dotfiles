#!/usr/bin/env sh

# ensure no duplicate instances
killall -q polybar

# wait for killed process' to end
while pgrep -x polybar >/dev/null; do sleep 1; done

polybar top &
