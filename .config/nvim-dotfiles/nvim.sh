#!/bin/bash

CURRENT_DIR=$(dirname $(readlink -f "${BASH_SOURCE[0]}"))

set -x
alias vim=nvim
CONFIG_PATH="$HOME/.config"
NVIM_CONFIG_PATH="$HOME/.config/nvim"
NVIM_CONFIG_PATH_LINK="$CURRENT_DIR/nvim"
mkdir -p "$CONFIG_PATH" 
ln -s "$NVIM_CONFIG_PATH_LINK" "$NVIM_CONFIG_PATH"
