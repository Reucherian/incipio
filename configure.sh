#!/bin/zsh

# things to configure -
# terminal (iterm2) colors, fonts using dynamic profiles
# vscode config file json - has builtin sync (turn it on)
# dotfiles
git clone https://github.com/Reucherian/.dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
stow zsh
stow starship
# folder icons for specific folders
#