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
     , ("M-r", spawn "~/refresh") ]
