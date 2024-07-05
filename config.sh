#!/bin/zsh
prompt_next(){
	local progress_next="n"
	while [ "$progress_next" != "y" ]
	do
		echo -n "continue? "
		read -k 1 progress_next
		echo ""
	done
}

# terminal (iterm2) colors, fonts u
# using dynamic profiles

echo "opening 󰟵 1password"
echo "enable ssh agent and command line agent"
sleep 5
open "/Applications/1Password.app"
prompt_next

echo "configuring  dotfiles"
if [ -d $HOME/.dotfiles ]; then cd $HOME/.dotfiles && ./config.sh; else git clone git@github.com:Reucherian/.dotfiles.git $HOME/.dotfiles; cd $HOME/.dotfiles && ./config.sh; fi # dotfiles
echo "done"

echo "opening   visual studio code" 
echo "enable setting sync with github"
sleep 5
open "/Applications/Visual Studio Code.app"
prompt_next


# folder icons for specific folders
