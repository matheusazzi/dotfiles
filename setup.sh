#!/usr/bin/env bash

# Get administrator access
sudo -v

# Install OS updates
sudo softwareupdate -i -a

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

# Install Homebrew apps
echo "→ Installing tools and apps..."
brew install $(cat brew/tools)
brew install $(cat brew/services)
brew cask install $(cat brew/apps)

# Remove outdated versions from the cellar
brew cleanup

echo "→ Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "→ Installing ASDF and programming languages..."
brew install asdf

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

asdf install ruby 2.6.5
asdf install nodejs 12.12.0

# Install Atom packages
apm install --packages-file ~/.atom/package.list
