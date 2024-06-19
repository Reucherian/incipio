#!/bin/zsh
# this shell script will install essential apps and scripts using homebrew.
check_install() {
    if [ $3 = "cli" ]; then
        if [ -x "$(command -v $1)" ]; then
            echo "The command $1 is already installed."
        else
            $2
        fi
    elif [ $3 = "app" ]; then
        if [ -d "/Applications/$1.app" ]; then
            echo "The application $1 is already installed."
        else
            $2
        fi
    fi
}

main() {
    # install command line tools
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