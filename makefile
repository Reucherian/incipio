
all: install configure
install_cli_tools:
	@echo "installing the cli tools"
	@ if [ "$$(xcode-select -p)" == "/Library/Developer/CommandLineTools" ]; then echo "cli tools is already installed"; else xcode-select --install; sudo xcodebuild -license accept; fi
install_brew: install_cli_tools
	@echo "installing the package manager homebrew"
	@if [ -x "$$(command -v brew)" ]; then echo "homebrew is already installed"; else /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi
install: install_brew
	@./install.sh
configure:
	@./config.sh
