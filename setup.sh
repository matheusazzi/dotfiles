#!/usr/bin/env bash

# Get administrator access
sudo -v

# Install OS updates
echo "→ Checking for software updates..."
sudo softwareupdate -i -r

# Accept Xcode License
sudo xcodebuild -license

# Copying files to home directory
echo "→ Copying files to $HOME ..."
cp git/.gitconfig ~/.gitconfig
cp git/.gitignore ~/.gitignore

cp macos/.hushlogin ~/.hushlogin
cp macos/.macos ~/.macos

cp asdf/.asdfrc ~/.asdfrc

cp helix/config.toml ~/.config/helix/config.toml

cp ruby/.default-gems ~/.default-gems
cp ruby/.gemrc ~/.gemrc
cp ruby/.irbrc ~/.irbrc
cp ruby/.pryrc ~/.pryrc

cp node/.npmrc ~/.npmrc

cp zsh/.exports ~/zsh/.exports
cp zsh/.aliases ~/zsh/.aliases
cp zsh/.functions ~/zsh/.functions
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

# Install ASDF, latest Ruby & Node.js
echo "→ Installing ASDF, Node.js & Ruby..."
brew install asdf

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf install ruby latest
asdf global ruby latest

# Install tools
echo "→ Installing packages and tools..."
brew install $(cat brew/tools)

# Install Postgres & Redis through ASDF
echo "→ Installing Postgres & Redis..."
asdf plugin-add postgres https://github.com/smashedtoatoms/asdf-postgres.git
asdf install postgres latest
asdf global postgres latest

asdf plugin-add https://github.com/smashedtoatoms/asdf-redis.git
asdf install redis latest
asdf global redis latest

echo "→ Sourcing .zshrc and .macos..."
source ~/.zshrc
source ~/.macos

# Install apps
echo "→ Installing apps..."
brew tap homebrew/cask-fonts
brew install --cask $(cat brew/apps)

# Remove outdated versions from the cellar
brew cleanup

# Restart the Finder app
killall finder
