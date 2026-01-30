#! /bin/bash

# Needed for python, terraform, lua, java
install_brew=true
install_go=true
install_ruby=true
# Npm is needed for typescript and bash lsp
install_node=true
install_rustup=true

arch=amd64
go_version=1.25.6

sudo apt install fd-find

if [ "$install_brew" = "true" ]; then
	curl -o- https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
fi

if [ "$install_node" = "true" ]; then
	brew install node@24
	echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@24/bin:$PATH"' >> ~/.zshrc
	echo 'export PATH="/home/linuxbrew/.linuxbrew/opt/node@24/bin:$PATH"' >> ~/.bashrc
	source ~/.zshrc
fi

brew install basedpyright
brew install hashicorp/tap/terraform-ls
brew install lua-language-server
brew install jdtls

npm install -i -g bash-language-server
npm install -i -g typescript typescript-language-server

if [ "$install_rustup" = "true" ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	source ~/.zshrc
fi
rustup compomemt rust-src
rustup component rust-analyzer

if [ "$install_ruby" = "true" ]; then
	sudo apt install ruby-full
fi
gem install ruby-lsp

sudo apt install clangd

if [ "$install_go" = "true" ]; then
	curl -s -o "go${go_version}.linux-${arch}.tar.gz" "https://go.dev/dl/go${go_version}.linux-${arch}.tar.gz"
	 rm -rf /usr/local/go && tar -C /usr/local -xzf "go${go_version}.linux-${arch}.tar.gz" 
fi
go install golang.org/x/tools/gopls@latest
