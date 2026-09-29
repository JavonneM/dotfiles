--############################
--## ENVIRONMENT VARIABLES ###
--############################

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- So dolphin can resolve openwith dialog (KDE weirdness)
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("XDG_DATA_DIRS", "/usr/share:/usr/local/share:$HOME/.local/share")

-- XDG User DIRS
hl.env("XDG_DESKTOP_DIR", "$HOME/Desktop")
hl.env("XDG_DOWNLOAD_DIR", "$HOME/Downloads")
hl.env("XDG_DOCUMENTS_DIR", "$HOME/Documents")
hl.env("XDG_MUSIC_DIR", "$HOME/Music")
hl.env("XDG_PICTURES_DIR", "$HOME/Pictures")
hl.env("XDG_VIDEOS_DIR", "$HOME/Videos")
