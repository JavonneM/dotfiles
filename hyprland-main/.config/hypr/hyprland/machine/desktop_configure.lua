--###############
--## MONITORS ###
--###############

-- See https://wiki.hyprland.org/Configuring/Monitors/
-- Port + land
-- monitor=DP-5,1920x1080@144,1080x430,1 #, vrr, 1
-- monitor=HDMI-A-3,1080x1920,0x0,1,transform,1
-- monitor=,preferred,auto,1

hl.monitor({
    output = "DP-3",
    mode = "1920x1080@144",
    position = "1920x0",
    scale = "1",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080",
    position = "0x0",
    scale = "1",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

--#####################
--## WORKSPACE RULES ##
--#####################

hl.workspace_rule({
    workspace = "1",
    monitor = "HDMI-A-1",
    default = true,
})

hl.workspace_rule({
    workspace = "2",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "3",
    monitor = "HDMI-A-1",
})

hl.workspace_rule({
    workspace = "4",
    monitor = "DP-3",
    default = true,
})

hl.workspace_rule({
    workspace = "5",
    monitor = "DP-3",
})

hl.workspace_rule({
    workspace = "6",
    monitor = "DP-3",
})

--#####################
--## WINDOW RULES ##
--#####################

hl.window_rule({
    match = {
        class = "steam",
    },
    workspace = "4",
    float = false,
})

hl.window_rule({
    match = {
        title = "^()$",
        class = "^(steam)$",
    },
    stay_focused = true,
    min_size = "1 1",
})
