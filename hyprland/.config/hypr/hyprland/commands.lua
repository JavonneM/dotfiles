-- Set programs that you use
local terminal = "kitty --start-as=minimized -e tmux"
local fileManager = "dolphin"
-- $menu = bemenu-run
local menu = "j4-dmenu-desktop --dmenu='bemenu -i -c -l 5 down --prompt \"run\" --border 2 --border-radius 15 --bdr \" --#33ccffee\" --margin 24 --hp 24 --width-factor 0.4 --nb \"##3f3f3f\" --nf \"##dcdccc\" --fn \"TTF:FiraCodeNerdFontMono-Regular.ttf 12\" --fb \"##1e1e2e\" --ff \"##cdd6f4\" --nb \"##1e1e2e\" --nf \"##cdd6f4\" --tb \"##1e1e2e\" --hb \"##1e1e2e\" --tf \"##f38ba8\" --hf \"##f9e2af\" --af \"##cdd6f4\" --ab \"##1e1e2e\"'"

return {
    terminal = terminal,
    fileManager = fileManager,
    menu = menu
}
