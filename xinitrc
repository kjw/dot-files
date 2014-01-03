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

xsetroot -cursor_name left_ptr
setxkbmap -layout
xmodmap ~/.Xmodmap
xcalib "~/colours/Color LCD-00000610-0000-9CF3-0000-000004273CC0.icc"
xset r rate 200 25
feh --bg-scale /usr/share/backgrounds/gnome/Bokeh_Tails.jpg 
#pulseaudio --start
exec xmonad

