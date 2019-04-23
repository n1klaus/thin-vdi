#!/bin/bash

for i in $(pacmd list-sinks | grep index | wc -l); do
    pactl set-sink-mute $i toggle
done

exit 0
