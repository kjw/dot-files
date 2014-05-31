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

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
export GNOME_KEYRING_CONTROL
export GNOME_KEYRING_PID

# Set the root window cursor
xsetroot -cursor_name left_ptr

# Switch some keys around
setxkbmap gb 
xmodmap ~/.Xmodmap

# Set a reasonable key repeat rate
xset r rate 200 25

# Select a reasonable colour profile
# xcalib "~/colours/Color LCD-00000610-0000-9CF3-0000-000004273CC0.icc"

# Pick a random wallpaper
feh --bg-fill -z ~/wallpapers

# Little tray
stalonetray &
nm-applet &
#pasystray &

#/usr/lib/gnome-settings-daemon/gnome-settings-daemon &

# Nice looking window fade in/out and shadows
# xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 -f -D 7 &
# compton --backend glx -Cf &

# Launch xmonad with dbus
exec dbus-launch --sh-syntax --exit-with-session xmonad

