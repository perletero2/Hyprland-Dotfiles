-- Main files sourcing -- 

require("monitors")
require("keybindings")
require("userprefs")
require("windowrules")
require("startup")

-- Secondary Files --

-- Hypr Tools --

-- Theme --

-- Workflows --

-- Shaders --


-- For Noctalia Color templates
require("noctalia").apply_theme()


-- >>> HYPRLAND VISUAL EDITOR (HVE) <<<
pcall(function() dofile(os.getenv("HOME") .. "/.cache/noctalia/HVE/overlay.lua") end)
-- <<< HYPRLAND VISUAL EDITOR (HVE) <<<
