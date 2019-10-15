#!/usr/bin/env bash

# Get administrator access
sudo -v

# Install OS updates
echo "→ Checking for software updates..."
sudo softwareupdate -i -r

# Copying files to home directory
echo "→ Copying files to $HOME ..."
cp atom/config.cson ~/.atom/config.cson
cp atom/package.list ~/.atom/package.list
cp atom/styles.less ~/.atom/styles.less

cp elixir/.iex.exs ~/.iex.exs

cp git/.gitconfig ~/.gitconfig
cp git/.gitignore ~/.gitignore

cp macos/.hushlogin ~/.hushlogin
cp macos/.macos ~/.macos

cp nvim/init.vim ~/.config/nvim/init.vim

cp ruby/.defult-gems ~/.defult-gems
cp ruby/.gemrc ~/.gemrc

cp tmux/.tmux.conf ~/.tmux.conf

cp zsh/.aliases ~/.aliases
cp zsh/.exports ~/.exports
cp zsh/.functions ~/.functions
cp zsh/.zshrc ~/.zshrc

cp .editorconfig ~/.editorconfig

# Install Homebrew
if test ! $(which brew)
then
  echo "→ Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

echo "→ Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
brew install zsh-syntax-highlighting

# Install tools
echo "→ Installing packages and tools..."
brew install $(cat brew/tools)

echo "→ Installing ASDF and programming languages..."
brew install asdf

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

asdf install ruby 2.6.5
asdf install nodejs 12.12.0

echo "→ Sourcing .zshrc and .macos..."
source ~/.zshrc
source ~/.macos

# Install apps
echo "→ Installing apps..."
brew install $(cat brew/services)
brew cask install $(cat brew/apps)

# Remove outdated versions from the cellar
brew cleanup

# Install Atom packages
echo "→ Installing Atom packages..."
apm install --packages-file ~/.atom/package.list

# Install vim-plug
echo "→ Installing vim-plug for nvim..."
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

killall finder
