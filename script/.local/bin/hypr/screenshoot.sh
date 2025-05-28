#!/bin/sh

FILE=$(xdg-user-dir PICTURES)/$(date +'%H-%M_%F_screen')

countdown() {

    notify-send --app-name="screenshot" "Screenshot" "Recording in 3" -t 1000
    sleep 1
    notify-send --app-name="screenshot" "Screenshot" "Recording in 2" -t 1000
    sleep 1
    notify-send --app-name="screenshot" "Screenshot" "Recording in 1" -t 1000
    sleep 1
}

r_screen ()
{
    sleep 1
    grim -g "$(slurp)" -t png "$FILE.png"
    if [[ $# -eq 1 ]]; then
        wl-copy < "$FILE.png"
    fi
}

a_screen ()
{
    countdown
    grim -t png "$FILE.png"
    if [[ $# -eq 1 ]]; then
        wl-copy < "$FILE.png"
    fi
}

v_screen()
{
    FILE=$(xdg-user-dir VIDEOS)/$(date +'%H-%M_%F_screen')
    countdown
    wf-recorder -f "$FILE.mp4"
}

vr_screen()
{
    FILE=$(xdg-user-dir VIDEOS)/$(date +'%H-%M_%F_screen')
    countdown
    wf-recorder -g "$(slurp)" -f "$FILE.mp4"
}

stop_screen() {
    kill $(pidof wf-recorder) SIGINT
}

options ()
{
    echo '  Region  Clip'
    echo '  Region  File'

    echo '  Screen  Clip'
    echo '  Screen  File'

    echo '  Region  File'
    echo '  Screen  File'

    echo "  Stop recording"
    echo "cancel"
}

choice=$( (options) | wofi -d -O alphabetical -p "Screenshot")


case $choice in
    '  Region  Clip')
        r_screen true
        ;;
    '  Region  File')
        r_screen
        ;;
    '  Screen  Clip')
        a_screen true
        ;;
    '  Screen  File')
        a_screen
        ;;
    '  Region  File')
        vr_screen
        ;;
    '  Screen  File')
        v_screen
        ;;
    '  Stop recording')
        stop_screen
        ;;
    *)
        exit
        ;;
esac
