import XMonad
import XMonad.Util.EZConfig
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.FadeInactive
import XMonad.Layout.NoBorders

layout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
    threeCol    = ThreeColMid nmaster delta ratio
    tiled       = Tall nmaster delta ratio
    nmaster     = 1         -- Default number of windows in the master pane
    ratio       = 1/2       -- Default proportion of screen occupied by master pane
    delta       = 3/100     -- Percent of screen to increment when resizing


main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ xmobarProp $ myConfig
myConfig = def
    { modMask    = mod4Mask,
      terminal   = "urxvt",
      layoutHook = smartBorders layout
    }
    `additionalKeysP`
    [ ("M-f"  , spawn "qutebrowser")
    , ("M-S-s", spawn "steam")
    , ("M-S-l", spawn "xscreensaver-command --lock")
    ]
