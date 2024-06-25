
all: install configure
install_brew:
	echo "installing the package manager homebrew"
	if [ -x "$$(command -v brew)" ]; then echo "homebrew is already installed"; else /bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; fi
install: install_brew
	./install.sh
configure:
	./config.sh