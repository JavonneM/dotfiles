#!/bin/zsh
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font
echo "font_family    FiraCode Nerd Font Mono Medium" >> $HOME/.config/kitty/kitty.conf
