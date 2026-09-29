-- You can split this configuration into multiple files
-- Create your files separately and then link them to this file like this:
-- source = ~/.config/hypr/myColors.conf

require("hyprland.init")
local c = require("hyprland.colours")

local ok, module = pcall(require, "hyprland.machine.colours")
if ok then
    c = module
end

--####################
--## LOOK AND FEEL ###
--####################

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

-- https://wiki.hyprland.org/Configuring/Variables/#general

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        -- https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        col = {
            active_border = { colors = { c.active_border_gradient_start, c.active_border_gradient_end }, angle = 45 },
            inactive_border = c.inactive_border,
        },
        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,
        -- Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle", --master #dwindle
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
        rounding = 10,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = c.decoration_shadow,
        },
        -- https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
            enabled = false,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
        enabled = false,
        -- Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
    },
    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
        -- Deprecated as of 0.55
        --     pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true, -- You probably want this
    },
    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
        new_status = "master",
    },
    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        force_default_wallpaper = -1,  -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false, -- If true disables the random hyprland logo / anime girl background. :(
        disable_splash_rendering = false,
    },
    --############
    --## INPUT ###
    --############
    -- https://wiki.hyprland.org/Configuring/Variables/#input
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        repeat_delay = 300,
        repeat_rate = 50,
        touchpad = {
            natural_scroll = false,
        },
    },
})
