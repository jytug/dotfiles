import XMonad
import XMonad.Util.EZConfig

main :: IO ()
main = xmonad $ def
    { modMask  = mod4Mask,
      terminal = "urxvt"
    }
    `additionalKeysP`
    [ ("M-f"  , spawn "qutebrowser")
    , ("M-S-s", spawn "steam")
    ]
