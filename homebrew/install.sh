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
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew doctor

# Install homebrew packages
brew install caskroom/cask/brew-cask
brew install coreutils
brew install wget
brew install git
brew install gcc
brew install vagrant
brew install --HEAD vim --with-python

brew cask doctor
brew tap caskroom/versions
brew cask install firefoxdeveloperedition
brew cask install dropbox
brew cask install evernote
brew cask install virtualbox
brew cask install sublime-text3


exit 0
