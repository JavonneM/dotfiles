# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# setup bash auto complete and git autocomplete
brew install git bash-completion stow
echo "[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion" >> ~/.bash_profile

# macos dot requirements
brew tap homebrew/cask-fonts
brew install tmux nvim kitty font-fira-mono-nerd-font

# mobile development
# install cocoapods
# sudo gem install cocoapods

# execute the generic terminal setup
source setup_functions.sh
configure_git_config
install_oh_my_zsh

stow common
