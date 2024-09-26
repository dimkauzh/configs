#!/bin/bash

volume_step=5
brightness_step=5
max_volume=150
notification_timeout=1000

function get_volume {
    pulsemixer --get-volume | awk '{print $1}'
}

function get_mute {
    pulsemixer --get-mute
}

function get_brightness {
    brightnessctl get
}

function get_volume_icon {
    volume=$(get_volume)
    mute=$(get_mute)
    if [ "$volume" -eq 0 ] || [ "$mute" -eq 1 ]; then
        volume_icon=""  # Mute icon
    elif [ "$volume" -lt 50 ]; then
        volume_icon=""  # Low volume icon
    else
        volume_icon=""  # High volume icon
    fi
}

function get_brightness_icon {
    brightness_icon=""
}

function show_volume_notif {
    volume=$(get_volume)
    get_volume_icon
    notify-send -t $notification_timeout -h string:x-dunst-stack-tag:volume_notif -h int:value:$volume "$volume_icon    $volume%"
}

function show_brightness_notif {
    brightness=$(get_brightness)
    max_brightness=$(brightnessctl max)
    percentage=$(( brightness * 100 / max_brightness ))
    get_brightness_icon
    notify-send -t $notification_timeout -h string:x-dunst-stack-tag:brightness_notif -h int:value:$percentage "$brightness_icon    $percentage%"
}

case $1 in
    volume_up)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pulsemixer --change-volume +$volume_step --max-volume $max_volume
        show_volume_notif
        ;;

    volume_down)
        pactl set-sink-mute @DEFAULT_SINK@ 0
        pulsemixer --change-volume -$volume_step --max-volume $max_volume
        show_volume_notif
        ;;

    volume_mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        show_volume_notif
        ;;

    brightness_up)
        brightnessctl set +$brightness_step%
        show_brightness_notif
        ;;

    brightness_down)
        brightnessctl set $brightness_step%-
        show_brightness_notif
        ;;

    *)
        notify-send "Error" "Invalid argument. Use 'volume_up', 'volume_down', 'brightness_up', or 'brightness_down'."
        ;;
esac
