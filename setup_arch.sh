sudo pacman -S git tmux kitty ttf-firacode-nerd nvim ttf-font-awesome stow

source setup_functions.sh
configure_git_config
install_oh_my_zsh
install_hyprland

stow common
stow hyprland
