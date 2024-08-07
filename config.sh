#!/bin/zsh
autoload -U colors && colors
if read -qs "?configure $fg_bold[yellow]󰟵 1password$reset_color (y/n)"; then
	echo ""	
	echo "opening application ..."
	open "/Applications/1Password.app"
	echo "=> enable ssh agent "
	echo "=> enable command line agent"
	read -s -k 1 "?press any key to continue ..."
	echo ""
else	
	echo ""
fi

if read -qs "?configure $fg_bold[green] dotfiles$reset_color (y/n) "; then
	echo ""
	echo "setting up ..."
	if [ -d $HOME/.dotfiles ]; then cd $HOME/.dotfiles && ./config.sh; else git clone git@github.com:Reucherian/.dotfiles.git $HOME/.dotfiles; cd $HOME/.dotfiles && ./config.sh; fi # dotfiles
	read -s -k 1 "?press any key to continue ..."
	echo ""

	if read -qs "?configure $fg_bold[cyan]󱋖 icloud sync$reset_color (y/n) "; then
		echo ""
		isync
	else
		echo ""
	fi
else
	echo ""

fi


if read -qs "?configure $fg_bold[blue]  visual studio code$reset_color (y/n) "; then
	echo ""
	open "/Applications/Visual Studio Code.app"
	echo "=> enable setting sync with github"
	read -s -k 1 "?press any key to continue ..."
	echo ""
else
	echo ""
	fi


# folder icons for specific folders
