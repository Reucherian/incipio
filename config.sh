#!/bin/zsh

# things to configure -
# terminal (iterm2) colors, fonts using dynamic profiles
# vscode config file json - has builtin sync (turn it on)
# dotfiles
if [ -d $HOME/.dotfiles ] then; cd $HOME/.dotfiles && ./config.sh; else git clone https://github.com/Reucherian/.dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && ./config.sh; fi;
# folder icons for specific folders
#