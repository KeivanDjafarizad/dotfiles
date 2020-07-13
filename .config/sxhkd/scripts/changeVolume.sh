#!/bin/bash
# changeVolume

msgId="991049"

pactl set-sink-volume 0 "$@" > /dev/null

volume="$(pamixer --get-volume)"

if [[ $volume == 0 ]]; then
    dunstify -a "changeVolume" -u low -i audio-volume-muted -r "$msgId" "Volume Muted"
else
    dunstify -a "changeVolume" -u low -i audio-volume-high -r "$msgId" "Volume: ${volume}%"
fi
