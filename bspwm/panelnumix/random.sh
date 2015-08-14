#!/bin/bash

FONT1="-*-profont-medium-*-*--12-*-*-*-*-*-*-1"
FONT2="-misc-stlarch-medium-r-normal--10-100-75-75-c-80-iso10646-1"

# Fetch the Colors
BG=$(cat $HOME/.colors/skyline | grep -i background | tail -c 8)
FG=$(cat $HOME/.colors/skyline | grep -i foreground | tail -c 8)


BLACK=$(cat $HOME/.colors/skyline | grep -i color8 | tail -c 8)
RED=$(cat $HOME/.colors/skyline | grep -i color9 | tail -c 8)
GREEN=$(cat $HOME/.colors/skyline | grep -i color10 | tail -c 8)
YELLOW=$(cat $HOME/.colors/skyline | grep -i color11 | tail -c 8)
BLUE=$(cat $HOME/.colors/skyline | grep -i color12 | tail -c 8)
MAGENTA=$(cat $HOME/.colors/skyline | grep -i color13 | tail -c 8)
CYAN=$(cat $HOME/.colors/skyline | grep -i color14 | tail -c 8)
WHITE=$(cat $HOME/.colors/skyline | grep -i color15 | tail -c 8)

function panel {

	ws() {
	ws=$(xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}')
		echo "${ws}"
	}

	menu() {
		echo "%{B$CYAN}%{F$BG} GMN  %{B-}%{F-}"
	}

	temp() {
	temp=$(sensors | awk '/Core 0/ {print +$3}')
		echo "%{B$BG}%{F$CYAN}  %{B-}%{F-}%{F$YELLOW} ${temp}"
	}
	
	fan(){
	fan=$(sensors | awk '/fan1/ {print +$2}')
		echo "%{B$BG}%{F$CYAN}  %{B-}%{F-}%{F$YELLOW} ${fan} RPM"
	}

	clock() {
	clock=$(date "+%b %d %Y %I:%M")
		echo "%{B$BG}%{F$CYAN}  %{B-}%{F-}%{F$YELLOW} ${clock}"
	}

	vol() {
	vol=$(amixer get Master | sed -nr '$ s:.*\[(.+%)].*:\1:p')
		echo "%{B$BG}%{F$CYAN}  %{B-}%{F-}%{F$YELLOW} ${vol}"
	}

	mus() {
	mus=$(mpc current)
	if [[ $mus ]]; then
		echo "%{B$BG}%{F$CYAN}  %{B-}%{F-}%{F$YELLOW} ${mus}"
	else
		echo
	fi
	return 
	}
	
	netstate() {
    	test -n "`ip route`" && echo "Connected" || echo "Disconnected"
	}


	echo " $(ws) $(menu) $(vol) %{c}$(mus) %{r}$(temp) $(fan) $(clock) "
 
}

while true 
 do
		echo "$(panel)"	
 done | lemonbar -g 1346x26+10+10 -f "$FONT1","$FONT2" -B "$BG" -F "$FG" -p &
