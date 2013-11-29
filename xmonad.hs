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
     , ("M-S-m", spawn "thunderbird")
     , ("M-S-b", spawn "chromium")
     , ("M-S-n", spawn "skype")
     , ("M-up", spawn "pulseaudio-ctl up")
     , ("M-down", spawn "pulseaudio-ctl up")
     , ("M-left", spawn "pulseaudio-ctl mute")
     , ("M-p", spawn "dmenu_run -fn 'Inconsolata-20' -b -nb '#002b36' -nf '#93a1a1' -sb '#073642' -sf '#cb4b16' -p '?>'")]
