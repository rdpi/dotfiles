#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

#####COMMENTED OUT FOR TESTS ############

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

#####BSPWM#####

xsetroot -cursor_name left_ptr &
xrdb ~/.Xresources
xset +fp /usr/share/fonts/local
xset fp rehash
hsetroot -fill ~/.wallpaper.jpg
xsetroot -cursor_name left_ptr &
compton &
sxhkd &
exec bspwm
