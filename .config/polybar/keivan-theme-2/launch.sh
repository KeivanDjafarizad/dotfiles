#!/usr/bin/env bash

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

polybar keivan -c $HOME/.config/polybar/keivan-theme-2/config.ini
