import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.EZConfig
 
main = do
xmproc <- spawnPipe "/usr/bin/xmobar-1" 
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
     , ("M-a x", spawn "xrandr --auto")
     , ("M-a y", spawn "play-youtube")
     , ("M-a t", spawn "terminator -e 'ssh -t pi ./t'")
     , ("M-a v", spawn "dmenu_video")
     , ("M-a d", spawn "dmenu_doc")
     , ("M-a f", spawn "dmenu_locate")
     , ("M-x", spawn "dmenu_ddg")
     , ("M-a n", spawn "gnome-control-center network")
     , ("<XF86AudioMute>", spawn "dzen_volume toggle")
     , ("<XF86AudioRaiseVolume>", spawn "dzen_volume up")
     , ("<XF86AudioLowerVolume>", spawn "dzen_volume down")
     , ("<XF86MonBrightnessDown>", spawn "dzen_brightness down")
     , ("<XF86MonBrightnessUp>", spawn "dzen_brightness up")
     , ("<XF86Calculator>", spawn "gnome-calculator")
     , ("M-s", spawn "dmenu_ssh")
     , ("M-p", spawn "dmenu_cmd")]
