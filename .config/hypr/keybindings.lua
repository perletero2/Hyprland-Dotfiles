----------------------
--- Main variables ---
----------------------

local mainMod = "SUPER"
local terminal = "kitty"
local browser = "firefox"
local explorer = "dolphin"
local editor = "nvim"
local ipc = "noctalia msg "
local pypr = "uwsm-app -- /usr/bin/pypr-client "

----------------
--- Keybinds ---
----------------

-- hl.bind(mainMod .. " + ", hl.dsp.)
-- hl.dsp.exec_cmd(ipc .. "") for Noctalia IPC Commands

-- 1. Window Management 

hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close focused Window" })
hl.bind("ALT + F4", hl.dsp.window.kill(), { description = "Kill focused window"})
hl.bind(mainMod .. " + Delete", hl.dsp.exec_cmd(ipc .. "session lock"), { description = "Lock Session" })
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle Floating" })
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.toggle(), { description = "Toggle Group" })
hl.bind(mainMod .. " + SHIFT + F11", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle Fullscreen" })
hl.bind(mainMod .. " + Page_Up", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { description = "Maximize Window" })
hl.bind("CONTROL + ALT + Delete", hl.dsp.exec_cmd(ipc .. "panel-toggle session"), { description = "Logout Menu" })
hl.bind("ALT_R + CONTROL_R", hl.dsp.exec_cmd(ipc .. "bar-toggle"), { description = "Toggle All Bars" })

hl.bind(mainMod .. " + KP_Page_down", function ()
    hl.workspace_rule({ workspace = "m[0]", layout = "dwindle" })
end, { description = "Set Layout to Dwindle" })

hl.bind(mainMod .. " + KP_Right", function ()
    hl.workspace_rule({ workspace = "m[0]", layout = "master" })
end, { description = "Set Layout to Master" })

hl.bind(mainMod .. " + KP_Page_up", function ()
    hl.workspace_rule({ workspace = "m[0]", layout = "scrolling" })
end, { description = "Set Layout to Scrolling" })

-- 2. Group Navigation

hl.bind(mainMod .. " + CONTROL + H", hl.dsp.group.next(), { description = "Change Active Group Backwards" })
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.group.prev(), { description = "Change Active Group Forwards" })

-- 3. Change Focus 

hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }), { description = "Focus Left" })
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }), { description = "Focus Right" })
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }), { description = "Focus Up" })
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }), { description = "Focus Down" })
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"), { description = "Window Switcher" })
hl.bind(mainMod .. " + Page_Down", hl.dsp.layout("swapwithmaster"), { description = "Switch Master Window" })

-- 4. Resize & Move Active Window

hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { description = "Resize Window Right" })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { description = "Resize Window Left" })
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { description = "Resize Window Up" })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { description = "Resize Window Down" })

hl.bind(mainMod .. " + ALT + Right", hl.dsp.window.move({ direction = "r" }), { description = "Move Window Right" })
hl.bind(mainMod .. " + ALT + Left", hl.dsp.window.move({ direction = "l" }), { description = "Move Window Left" })
hl.bind(mainMod .. " + ALT + Up", hl.dsp.window.move({ direction = "u" }), { description = "Move Window Up" })
hl.bind(mainMod .. " + ALT + Down", hl.dsp.window.move({ direction = "d" }), { description = "Move Window Down" })

hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle Dwindle Split"})

-- 5. Move & Resize with mouse

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Hold to Move Window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Hold to Resize Window" })
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), { mouse = true, description = "Hold to Move Window" })
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), { mouse = true, description = "Hold to Resize Window" })

-- 6. Launcher 

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal), { description = "Terminal Emulator" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(explorer), { description = "File Explorer" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code-oss"), { description = "Text Editor" })
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser), { description = "Web Browser" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("lutris"), { description = "Lutris" })
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(ipc .. "panel-toggle aabidk20/yt-music:panel"), { description = "Youtube Music" })
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(ipc .. "panel-toggle weinguyen/procmon:panel"), { description = "System Monitor" })
hl.bind(mainMod .. " + SHIFT + Escape", hl.dsp.exec_cmd("kitty btop"), { description = "Btop" })
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd(ipc .. "panel-toggle yuuto/calculator:panel"), { description = "Calculator" })
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"), { description = "Application Launcher" })

-- 7. Menus

hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd(ipc .. "panel-toggle nightwatch75/file-search:panel"), { description = "File Finder" })
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher /web"), { description = "Web Favourites" })
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd(ipc .. "panel-toggle dunarand/bookmarks:panel search"), { description = "Web Bookmarks" })
hl.bind(mainMod .. " + slash", hl.dsp.exec_cmd(ipc .. "panel-toggle kenn/keybind-cheatsheet:cheatsheet"), { description = "Keybindings Hint" })
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher /emo"), { description = "Emoji Picker" })
--hl.bind(mainMod .. " + period", hl.dsp.exec_cmd(ipc .. "")) -- Glyph picker (rofi script, no Noctalia equivalent
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard"), { description = "Clipboard Preview" })
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd(ipc .. "panel-toggle clipboard history"), { description = "Clipboard Manager" })
hl.bind(mainMod .. " + N",hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/notes:panel"), { description = "Open Notes" })
hl.bind(mainMod .. " + SHIFT + N",hl.dsp.exec_cmd(ipc .. "panel-toggle nightwatch75/todo:panel"), { description = "Open Todo List" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(ipc .. "panel-toggle alexander/mimir:chat"), { description = "Open Mimir AI Chat" })

-- 8. Dropdown Menus

hl.bind(mainMod .. " + ALT + T", hl.dsp.exec_cmd(pypr .. "toggle console"), { description = "Dropdown Terminal" })
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(pypr .. "toggle rmpc"), { description = "Dropdown RMPC" })

-- 9. Hardware CONTROL


hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"), { description = "Toggle Mute Output" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { description = "Decrease Volume" })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { description = "Increase Volume" })

-- 10. Media CONTROL

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle Media Play/Pause" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle Media Play/Pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { description = "Media Next" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Media Previous" })

-- 11. Brightness control


hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { description = "Increase Brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { description = "Decrease Brightness" })

-- 12. Utilities

hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"), { description = "Switch Keyboard Layout" })
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd(ipc .. "plugin nomadcxx/gamer-mode:service all toggle"), { description = "Toggle Gamemode" })
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd(ipc .. "panel-toggle alexander/game-launcher:browser"), { description = "Run Game Launcher" })

-- 13. Screen Capture

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(ipc .. "plugin alexander/screen-toolkit:service all colorPicker"), { description = "Pick Color (Hex)" })
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(ipc .. "plugin alexander/screen-toolkit:service all annotate"), { description = "Partial Screenshot" })
hl.bind(mainMod .. " + CONTROL + P", hl.dsp.exec_cmd(ipc .. "plugin alexander/screen-toolkit:service all annotateWindow"), { description = "Window Screenshot" })
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd(ipc .. "plugin alexander/screen-toolkit:service all ocr"), { description = "OCR Tool" })
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "plugin alexander/screen-toolkit:service all annotateFullscreen"), { description = "Fullscreen Screenshot" })

-- 14. Theming and Wallpaper

hl.bind(mainMod .. " + KP_Add", hl.dsp.exec_cmd(ipc .. "wallpaper-next"), { description = "Next Wallpaper" })
hl.bind(mainMod .. " + KP_Subtract", hl.dsp.exec_cmd(ipc .. "wallpaper-previous"), { description = "Previous Wallpaper" })
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd(ipc .. "panel-toggle wallpaper"), { description = "Wallpaper Select Menu" })
hl.bind(mainMod .. " + CONTROL + W", hl.dsp.exec_cmd(ipc .. "panel-toggle noctalia/wallhaven:browser"), { description = "Wallhaven Select Menu" })
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd(ipc .. "panel-toggle linux-fertxo/hyprland-visual-editor:hve-panel"), { description = "Visual Editor Panel" })
hl.bind(mainMod .. " + KP_Home", hl.dsp.exec_cmd(ipc .. "bar-toggle top"), { description = "Toggle Top Bar" })
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(ipc .. "panel-toggle control-center"), { description = "Control Center" })
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd(ipc .. "settings-toggle"), { description = "System Settings" })
--hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(ipc .. "")) -- Launch theme select menu
--hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd(ipc .. "")) -- Launch animations select menu
--hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd(ipc .. "")) -- Toggle Noctalia settings menu

-- 15. Workspaces

for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}), { description = "Switch to workspace" })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move window to workspace" })
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }), { description = "Move window to workspace (silent)" })
end

hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.focus({ workspace = "r+1" }), { description = "Focus Next Workspace" })
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.focus({ workspace = "r-1" }), { description = "Focus Previous Workspace" })

hl.bind(mainMod .. " + CONTROL + Down", hl.dsp.focus({ workspace = "emptynm" }), { description = "Jump to Next Empty Workspace" })

hl.bind(mainMod .. " + CONTROL + ALT + Right", hl.dsp.window.move({ workspace = "r+1" }), { description = "Move to Next Workspace" })
hl.bind(mainMod .. " + CONTROL + ALT + Left", hl.dsp.window.move({ workspace = "r-1" }), { description = "Move to Previous Workspace" })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll to Next Workspace" })
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll to Previous Workspace" })

-- 16. Move to Scratchpads

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"), { description = "Toggle Scratchpad" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }), { description = "Move to Scratchpad" })
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:magic", follow = false }), { description = "Move to Scratchpad (Silent)" })

