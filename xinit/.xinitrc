#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec awesome
#exec openbox-session
#exec startxfce4
#exec i3

##Enable TrackPoint scrolling

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95

##### BSPWM #####

xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash
xmodmap ~/.xmodmaprc
hsetroot -solid "#6d6a80"
hsetroot -solid "#eeeeee"
hsetroot -fill .wallpaper.png
xsetroot -cursor_name left_ptr &
compton &
sxhkd &
mpd &
pcmanfm -d &
export PATH=$PATH:/home/rdpi/.config/bspwm/panel/
export _JAVA_AWT_WM_NONREPARENTING=2
exec bspwm
