#!/bin/zsh

# things to configure -
# terminal (iterm2) colors, fonts using dynamic profiles
# vscode config file json - has builtin sync (turn it on)
# dotfiles
if [ -d $HOME/.dotfiles ] then; git clone https://github.com/Reucherian/.dotfiles.git $HOME/.dotfiles; fi;
cd $HOME/.dotfiles;
./config.sh
# folder icons for specific folders
#