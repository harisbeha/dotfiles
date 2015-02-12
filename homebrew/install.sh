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

# Some tools look for XCode, even though they don't need it.
# https://github.com/joyent/node/issues/3681
# https://github.com/mxcl/homebrew/issues/10245
if [[ ! -d "$('xcode-select' -print-path 2>/dev/null)" ]]; then
  sudo xcode-select -switch /usr/bin
fi


# Tap Homebrew kegs.
function brew_tap_kegs() {
  kegs=($(setdiff "${kegs[*]}" "$(brew tap)"))
  if (( ${#kegs[@]} > 0 )); then
    e_header "Tapping Homebrew kegs: ${kegs[*]}"
    for keg in "${kegs[@]}"; do
      brew tap $keg
    done
  fi
}

# Install Homebrew recipes.
function brew_install_recipes() {
  recipes=($(setdiff "${recipes[*]}" "$(brew list)"))
  if (( ${#recipes[@]} > 0 )); then
    e_header "Installing Homebrew recipes: ${recipes[*]}"
    for recipe in "${recipes[@]}"; do
      brew install $recipe
    done
  fi
}

brew update
brew doctor

# Install homebrew packages
echo "Installing Brew Items"

# Homebrew recipes
recipes=(
  coreutils
  git
  git-extras
  htop-osx
  hub
  zsh
  tmux
  gcc
  mercurial
  wget
  coreutils
  ssh-copy-id
  terminal-notifier
  vim --with-python
  macvim
)

brew_install_recipes


# Ensure the cask keg and recipe are installed.
kegs=(caskroom/cask)
brew_tap_kegs
recipes=(brew-cask)
brew_install_recipes


echo "Installing Brew Cask"
brew install caskroom/cask/brew-cask
brew cask update
brew cask doctor



# Hack to show the first-run brew-cask password prompt immediately.
brew cask info this-is-somewhat-annoying 2>/dev/null

# Homebrew casks
casks=(
  # Applications
  chromium
  chronosync
  dropbox
  firefox
  google-chrome
  gyazo
  istat-menus
  macvim
  omnidisksweeper
  the-unarchiver
  totalfinder
  vagrant
  virtualbox
  evernote
  razorsql
  cinch
  github
  # Quick Look plugins
  #betterzipql
  #qlcolorcode
  #qlmarkdown
  #qlprettypatch
  #qlstephen
  #quicklook-csv
  #quicklook-json
  #quicknfo
  #suspicious-package
  #webp-quicklook
)

# Install Homebrew casks.
casks=($(setdiff "${casks[*]}" "$(brew cask list 2>/dev/null)"))
if (( ${#casks[@]} > 0 )); then
  e_header "Installing Homebrew casks: ${casks[*]}"
  for cask in "${casks[@]}"; do
    brew cask install $cask
  done
  brew cask cleanup
fi


brew cleanup
brew cask cleanup
exit 0
