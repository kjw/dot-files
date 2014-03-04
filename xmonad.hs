import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
 
main = do
xmproc <- spawnPipe "/usr/bin/xmobar /home/karl/.xmobarrc" 
xmonad $ defaultConfig
     { manageHook = manageDocks <+> manageHook defaultConfig
     , layoutHook = avoidStruts  $ layoutHook defaultConfig	
     , terminal    = "terminator"
     , modMask     = mod4Mask
     , borderWidth = 1
     , normalBorderColor = "#93a1a1"
     , focusedBorderColor = "#586e75"
     }
     `additionalKeysP`
     [ ("M-o", spawn "xrandr --output eDP1 --auto")
     , ("M-S-o", spawn "xrandr --output eDP1 --off")
     , ("M-w", spawn "xrandr --auto")
     , ("M-a y", spawn "play-youtube")
     , ("M-a t", spawn "terminator -e 'ssh -t pi ./t'")
     , ("M-a v", spawn "dmenu_video")
     , ("M-a d", spawn "dmenu_doc")
     , ("M-a f", spawn "dmenu_locate")
     , ("M-a q", spawn "dmenu_ddg")
     , ("<XF86AudioMute>", spawn "pulseaudio-ctl mute && paplay /usr/share/pommed/click.wav")
     , ("<XF86AudioRaiseVolume>", spawn "pulseaudio-ctl up && paplay /usr/share/pommed/click.wav")
     , ("<XF86AudioLowerVolume>", spawn "pulseaudio-ctl down && paplay /usr/share/pommed/click.wav")
     , ("<XF86MonBrightnessDown>", spawn "xbacklight - 10%")
     , ("<XF86MonBrightnessUp>", spawn "xbacklight + 10%")
     , ("<XF86KbdBrightnessUp>", spawn "keyboard_backlight.sh up")
     , ("<XF86KbdBrightnessDown>", spawn "keyboard_backlight.sh down")
     , ("M-s", spawn "dmenu_ssh")
     , ("M-p", spawn "dmenu_run -fn 'Inconsolata-20' -b -nb '#002b36' -nf '#93a1a1' -sb '#073642' -sf '#cb4b16' -p '?>'")]
