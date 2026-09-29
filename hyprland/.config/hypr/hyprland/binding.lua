local c = require("hyprland.commands")
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(c.terminal))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(c.fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(c.menu))
hl.bind(mainMod .. " + Z", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))

hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + M", hl.dsp.focus({ workspace = "r+1" }))

hl.bind(mainMod .. " + SHIFT + N", hl.dsp.window.move({ workspace = -1 }))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "+1" }))

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + SHIFT + O", hl.dsp.layout("swapsplit"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim -g \"$(slurp)\""))
hl.bind("Print", hl.dsp.exec_cmd("grim"))

hl.bind(mainMod .. " + R", hl.dsp.submap(""))
hl.define_submap("", function()
    hl.bind("H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
    hl.bind("L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
    hl.bind("K", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })
    hl.bind("J", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
    hl.bind("CONTROL + c", hl.dsp.submap("reset"))
    hl.bind("catchall", hl.dsp.submap("reset"))
end)
