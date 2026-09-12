----------------------
----- User Prefs -----
----------------------

-- Set your personal hyprland configuration here
-- See https://wiki.hypr.land/Configuring for more informations

--------------
--- Inputs ---
--------------

hl.config({
    input = {
        kb_layout  = "us,fr",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0,

        numlock_by_default = true,

        touchpad = {
            natural_scroll = false,
        },
    },
})

------------------
--- Appearance ---
------------------

hl.config({
    general = {
        border_size = 2,
        gaps_in = 2,
        gaps_out = 6,
        layout = "dwindle",
    },

    decoration = {
        rounding = 8,
        fullscreen_opacity = 1,
        active_opacity = 0.8,
        inactive_opacity = 0.8,

        blur = {
            enabled = true,
            new_optimizations = true,
            xray = true,
            size = 8,
            passes = 4,
        }

    },
})

---------------
--- Layouts ---
---------------

hl.config({
    master = {
        new_status = "slave",
    },

    dwindle = {
        preserve_split = true,
    }
})



------------
--- Misc ---
------------

hl.config ({
    cursor = {
        inactive_timeout = 10,
    },
})

