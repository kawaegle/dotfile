#!/bin/zsh

station="wlan0"
iwctl station $station scan 1>&2 /dev/null
sleep 2
iwctl_show=$(iwctl station $station show | tr -s ' ' ' ')
echo $iwctl_show | grep -w "State connected" > /dev/null

if [[ $? == 0 ]]; then
    network_name=$(echo $iwctl_show | grep -w "Connected network" | cut -d ' ' -f 17)
    notify-send "Already connect to $network_name" -u normal -a iwctl_connector -t 5000 -c Network
    exit 1
fi
ap_connection=$(iwctl station $station get-networks | tail -n+5 | tr -s ' ' ' ' | cut -d ' ' -f 2 | fzf)
iwctl station $station connect $ap_connection
if [[ $? != 0 ]]; then
    notify-send "Fail connect to $ap_connection" -u critical -a iwctl_connector -t 5000 -c Network
    exit 1
fi
notify-send "Success connect to $ap_connection" -u normal -a iwctl_connector -t 5000 -c Network
