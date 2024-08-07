#!/bin/zsh
# this shell script will install essential apps and scripts using homebrew.
check_install() {
    case $3 in 
    "cli")
        if [ -x "$(command -v $1)" ]; then
            echo "The command $1 is already installed."
        else
            $pkg_mngr $pkg_mngr_cmd $2
        fi
        ;;
    "app")
        if [ -d "/Applications/$1.app" ]; then
            echo "The application $1 is already installed."
        else
	    $pkg_mngr $pkg_mngr_cmd $pkg_mngr_cmd_cask $2
        fi
        ;;
    "mngr")
        if [ -L "${pkg_mngr_path}${1}" ]; then
            echo "The package $1 is already installed and linked."
        else
	   $pkg_mngr $pkg_mngr_cmd $2 
        fi
        ;;
    "font")
        if [ -d "${pkg_mngr_font_path}${1}" ]; then
	    echo "The font $1 is already installed."
	else
	   $pkg_mgr $pkg_mngr_cmd $2
	fi
	;;
    esac
}

brew_init(){
    pkg_mngr=brew
    pkg_mngr_path="/opt/homebrew/opt/"
    pkg_mngr_font_path="/opt/homebrew/Caskroom/"
    pkg_mngr_cmd=install
    pkg_mngr_cmd_cask=--cask
}

main() {
    brew_init
    # does not require command line tools installation since git will need command line tools
    check_install "tmux" tmux "cli" # terminal multiplexer
    check_install "tpm" tpm "mngr" # terminal multiplexer package manager
    check_install "fzf"  fzf "cli" # fuzzy finder command line utility
    check_install "nvim" neovim "cli" # terminal code editor
    check_install "stow" stow "cli" # link manager for dotfiles
    check_install "starship" starship "cli" # terminal prompt
    check_install "cmatrix" cmatrix "cli" # fun uility
    check_install "neofetch" neofetch  "cli" # spec display utility
    check_install "htop" htop "cli" # resource dashboard utility
    check_install "mas" mas "cli" # 
    # installing applications
    check_install "Arc" arc "app"  # browser
    check_install "Visual Studio Code" visual-studio-code "app" # graphical code editor
    check_install "1Password" 1password "app" # password manager
    check_install "Swish" swish "app" # window manager
    check_install "Bartender 5" bartender "app" # menu bar manager
    check_install "IINA" iina "app" # media player
    check_install "WezTerm" wezterm "app" # terminal app
    check_install "logioptionsplus" logi-options-plus "app" # peripherals app
    check_install "font-monaspace-nerd-font" font-monaspace-nerd-font "font" 
}

main
