local active_border_gradient_start = "rgba(ff3333ee)"
local active_border_gradient_end = "rgba(99ff00ee)"
local inactive_border = "rgba(595959aa)"
local decoration_shadow = "rgba(1a1a1aee)"

hl.config({
    general = {
        col = {
            active_border = { colors = { active_border_gradient_start, active_border_gradient_end }, angle = 45 },
            inactive_border = inactive_border,
        },
    },
    decoration = {
        shadow = {
             color = decoration_shadow,
        },
    }
})
