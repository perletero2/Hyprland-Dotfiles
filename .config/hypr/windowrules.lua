--------------------
--- Idle Inhibit ---
--------------------

hl.window_rule({
  name      = "idle-inhibit",
  match     = { class = "^(.*celluloid.*)$|^(.*mpv.*)$|^(.*vlc.*)$|^(.*haruna.*)$|^(.*[Ss]potify.*)$|^(.*LibreWolf.*)$|^(.*floorp.*)$|^(.*brave-browser.*)$|^(.*firefox.*)$|^(.*chromium.*)$|^(.*zen.*)$|^(.*vivaldi.*)$" },
  idle_inhibit = "fullscreen",
})

--------------------------
--- Picture in Picture ---
--------------------------

hl.window_rule({
    name = "hyde_picture_in_picture",
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    tag = "+picture-in-picture",
    tag = "+hyde_picture_in_picture",
    float = true,
    keep_aspect_ratio = true,
    move = { "monitor_w * 0.73", "monitor_h * 0.72" },
    size = { "monitor_w * 0.25", "monitor_h * 0.25" },
    pin = true,
})

---------------
--- Opacity ---
---------------

hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "1 1 1" })
hl.window_rule({ match = { class = "^(brave-browser)$" }, opacity = "0.9 0.9 1" })
hl.window_rule({ match = { class = "^(code-oss)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^([Cc]ode)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(code-url-handler)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(code-insiders-url-handler)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(org.kde.dolphin)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(org.kde.ark)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(nwg-look)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(qt5ct)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(qt6ct)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(kvantummanager)$" }, opacity = "0.8 0.8 1" })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(nm-applet)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(org.freedesktop.impl.portal.desktop.gtk)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^(org.freedesktop.impl.portal.desktop.hyprland)$" }, opacity = "0.8 0.7 1" })
hl.window_rule({ match = { class = "^([Ss]team)$" }, opacity = "0.7 0.7 1" })
hl.window_rule({ match = { class = "^(steamwebhelper)$" }, opacity = "0.7 0.7 1" })
hl.window_rule({ match = { class = "^([Ss]potify)$" }, opacity = "0.7 0.7 1" })
hl.window_rule({ match = { initial_title = "^(Spotify Free)$" }, opacity = "0.7 0.7 1" })
hl.window_rule({ match = { initial_title = "^(Spotify Premium)$" }, opacity = "0.7 0.7 1" })

hl.window_rule({ match = { class = "^(com.github.rafostar.Clapper)$" }, opacity = "0.9 0.9" }) -- Clapper-Gtk
hl.window_rule({ match = { class = "^(com.github.tchx84.Flatseal)$" }, opacity = "0.8 0.8" }) -- Flatseal-Gtk
hl.window_rule({ match = { class = "^(hu.kramo.Cartridges)$" }, opacity = "0.8 0.8" }) -- Cartridges-Gtk
hl.window_rule({ match = { class = "^(com.obsproject.Studio)$" }, opacity = "0.8 0.8" }) -- Obs-Qt
hl.window_rule({ match = { class = "^(gnome-boxes)$" }, opacity = "0.8 0.8" }) -- Boxes-Gtk
hl.window_rule({ match = { class = "^(vesktop)$" }, opacity = "0.8 0.8" }) -- Vesktop
hl.window_rule({ match = { class = "^(discord)$" }, opacity = "0.8 0.8" }) -- Discord-Electron
hl.window_rule({ match = { class = "^(WebCord)$" }, opacity = "0.8 0.8" }) -- WebCord-Electron
hl.window_rule({ match = { class = "^(ArmCord)$" }, opacity = "0.8 0.8" }) -- ArmCord-Electron
hl.window_rule({ match = { class = "^(app.drey.Warp)$" }, opacity = "0.8 0.8" }) -- Warp-Gtk
hl.window_rule({ match = { class = "^(net.davidotek.pupgui2)$" }, opacity = "0.8 0.8" }) -- ProtonUp-Qt
hl.window_rule({ match = { class = "^(yad)$" }, opacity = "0.8 0.8" }) -- Protontricks-Gtk
hl.window_rule({ match = { class = "^(Signal)$" }, opacity = "0.8 0.8" }) -- Signal-Gtk
hl.window_rule({ match = { class = "^(io.github.alainm23.planify)$" }, opacity = "0.8 0.8" }) -- Planify-Gtk
hl.window_rule({ match = { class = "^(io.gitlab.theevilskeleton.Upscaler)$" }, opacity = "0.8 0.8" }) -- Upscaler-Gtk
hl.window_rule({ match = { class = "^(com.github.unrud.VideoDownloader)$" }, opacity = "0.8 0.8" }) -- VideoDownloader-Gtk
hl.window_rule({ match = { class = "^(io.gitlab.adhami3310.Impression)$" }, opacity = "0.8 0.8" }) -- Impression-Gtk
hl.window_rule({ match = { class = "^(io.missioncenter.MissionCenter)$" }, opacity = "0.8 0.8" }) -- MissionCenter-Gtk
hl.window_rule({ match = { class = "^(io.github.flattool.Warehouse)$" }, opacity = "0.8 0.8" }) -- Warehouse-Gtk

----------------
--- Floating ---
----------------

hl.window_rule({ match = { class = "^(Signal)$" }, float = true }) -- Signal-Gtk
hl.window_rule({ match = { class = "^(com.github.rafostar.Clapper)$" }, float = true }) -- Clapper-Gtk
hl.window_rule({ match = { class = "^(app.drey.Warp)$" }, float = true }) -- Warp-Gtk
hl.window_rule({ match = { class = "^(net.davidotek.pupgui2)$" }, float = true }) -- ProtonUp-Qt
hl.window_rule({ match = { class = "^(yad)$" }, float = true }) -- Protontricks-Gtk
hl.window_rule({ match = { class = "^(eog)$" }, float = true }) -- Imageviewer-Gtk
hl.window_rule({ match = { class = "^(io.github.alainm23.planify)$" }, float = true }) -- Planify-Gtk
hl.window_rule({ match = { class = "^(io.gitlab.theevilskeleton.Upscaler)$" }, float = true }) -- Upscaler-Gtk
hl.window_rule({ match = { class = "^(com.github.unrud.VideoDownloader)$" }, float = true }) -- VideoDownloader-Gtk
hl.window_rule({ match = { class = "^(io.gitlab.adhami3310.Impression)$" }, float = true }) -- Impression-Gtk
hl.window_rule({ match = { class = "^(io.missioncenter.MissionCenter)$" }, float = true }) -- MissionCenter-Gtk
hl.window_rule({ match = { class = "^(.*dropdown.*)$" }, float = true }) -- Scratchpad dropdowns
hl.window_rule({ match = { initial_title = "^(.*dropdown.*)$" }, float = true }) -- Scratchpad dropdowns

------------
--- Misc ---
------------

-- workaround for jetbrains IDEs dropdowns/popups cause flickering
hl.window_rule({ match = { class = "^(.*jetbrains.*)$" }, no_initial_focus = true })

-------------------
--- Layer Rules ---
-------------------

hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, ignore_alpha = 0 })
hl.layer_rule({ match = { namespace = "logout_dialog" }, blur = true })

----------------
--- Noctalia ---
----------------

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.2,
  blur = true,
  blur_popups = true,
})

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})
