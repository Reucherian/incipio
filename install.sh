#!/bin/zsh
# this shell script will install essential apps and scripts using homebrew.
check_install() {
    case $3 in 
    "cli")
        if [ -x "$(command -v $1)" ]; then
            echo "The command $1 is already installed."
        else
            $2
        fi
        ;;
    "app")
        if [ -d "/Applications/$1.app" ]; then
            echo "The application $1 is already installed."
        else
            $2
        fi
        ;;
    "brew")
        if [ -L "/opt/homebrew/opt/$1" ]; then
            echo "The package $1 is already installed and linked."
        else
            $2
        fi
        ;;
    esac
}

main() {
    # does not require command line tools installation since git will need command line tools
    check_install "tmux" "brew install tmux" "cli" # terminal multiplexer
    check_install "tpm" "brew install tpm" "brew" # terminal multiplexer package manager
    check_install "fzf" "brew install fzf" "cli" # fuzzy finder command line utility
    check_install "nvim" "brew install neovim" "cli" # terminal code editor
    # installing applications
    check_install "Arc" "brew install --cask arc" "app"  # browser
    check_install "Visual Studio Code" "brew install --cask visual-studio-code" "app" # graphical code editor
    check_install "1Password" "brew install --cask 1password" "app" # password manager
    check_install "Swish" "brew install --cask swish" "app" # window manager
    check_install "Bartender 5" "brew install --cask bartender" "app" # menu bar manager
    check_install "IINA" "brew install --cask iina" "app" # media player
    check_install "iTerm" "brew install --cask iterm2" "app" # terminal app
    check_install "logioptionsplus" "brew install --cask logi-options-plus" "app" # peripherals app
    # check_install "" "" "font"
}

main
