#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew doctor

# Install homebrew packages
echo "Installing Brew Items"
brew install coreutils
brew install wget
brew install git
brew install gcc
brew install vagrant
brew install zsh
brew install tmux
brew install sqlite3
brew install --HEAD vim --with-python

echo "Installing Brew Cask"
brew install caskroom/cask/brew-cask
brew cask update
brew cask doctor

echo "Install applications via Brew Cask"
brew tap caskroom/versions
brew cask install firefoxdeveloperedition
brew cask install dropbox
brew cask install evernote
brew cask install virtualbox
brew cask install sublime-text3


exit 0
