#! /usr/bin/env bash

netspeed_file="$(dirname $0)/net-speed.sh"

updates_regular="$(checkupdates | wc -l)"
updates_aur="$(paru -Qua | wc -l)"
updates="$updates_regular&$updates_aur"

i3status | while :
do
	read line

	keyboard="$(xkblayout-state print \"%s\")"
	keyboard="${keyboard:1:-1}"

	netspeed="$($netspeed_file)"

	echo "$updates | ${netspeed}${line} | $keyboard"
done