# Install bash it
install_bash_it() {
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
    ~/.bash_it/install.sh
}

install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # install powerline fonts
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts && ./install.sh
    cd .. && rm -rf fonts
    # cp .zshrc ~/
    # echo "Please add\n'plugins=(git web-search)' and 'ZSH_THEME="agnoster"'\n above 'source \$ZSH/oh-my-zsh.sh' in ~/.zshrc"
}


install_hyprland() {
    sudo pacman -S Hyprland qt5-wayland swaync waybar j4-dmenu-desktop bemenu hyprpaper wl-clipboard grimp slurp
}

# Configure Git Config
configure_git_config() {
    git config --global user.name "Javonne Martin"
    git config --global user.email "javonne.martin@gmail.com"
    git config --global core.excludesfile ~/.gitignore

    #alias
    git config --global alias.co checkout
    git config --global alias.lg1 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
    git config --global alias.lg2 "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"
    git config --global alias.lg "lg1"

    # merge
    git config --global merge.tool vimdiff
    git config --global merge.conflictstyle diff3
    # mergetool
    git config --global mergetool.keepBackup false

    # cp .gitignore ~/
}
