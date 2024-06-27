#!/bin/zsh

# terminal (iterm2) colors, fonts u
# using dynamic profiles
echo "sign into 👨🏻‍💻 visual studio code with setting sync using the github account for Reucherian"
if [ -d $HOME/.dotfiles ]; then cd $HOME/.dotfiles && ./config.sh; else git clone https://github.com/Reucherian/.dotfiles.git $HOME/.dotfiles; cd $HOME/.dotfiles && ./config.sh; fi # dotfiles
# folder icons for specific folders