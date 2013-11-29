xsetroot -cursor_name left_ptr
setxkbmap -layout
xmodmap ~/.Xmodmap
xcalib "~/colours/Color LCD-00000610-0000-9CF3-0000-000004273CC0.icc"
xset r rate 200 25
feh --bg-scale ~/wallpaper.jpeg
pulseaudio --start
exec xmonad
#exec startxfce4 
