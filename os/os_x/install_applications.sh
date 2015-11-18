#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" && source "../utils.sh"


# Homebrew Taps

declare -a HOMEBREW_TAPS=(
    "neovim/neovim"
)

# Homebrew Formulae
# https://github.com/Homebrew/homebrew

declare -a HOMEBREW_FORMULAE=(
    "bash-completion"
    "caskroom/cask/brew-cask"
    "git"
    "git-extras"
    "imagemagick --with-webp"
    "node"
    "vim --with-python --override-system-vi"
    "python"
    "node"
    "hub"
    "wget"
    "coreutils"
    "ssh-copy-id"
    "zopfli"
    "tmux"
    "rbenv"
    "ruby-build"
    "ctags-exuberant"
    "neovim"
    "the_silver_searcher"
)

# Homebrew Casks
# https://github.com/caskroom/homebrew-cask

declare -a HOMEBREW_CASKS=(
    "chromium"
    "dropbox"
    "flash"
    "google-chrome"
    "imageoptim"
    "the-unarchiver"
    "transmission"
)

# Homebrew Alternate Casks
# https://github.com/caskroom/homebrew-versions

declare -a HOMEBREW_ALTERNATE_CASKS=(
    "firefox-nightly"
)

#TODO: configure to install gems later.
declare -a RUBY_GEMS=(
    "rails"
)

declare -a HOMEBREW_FONT_CASKS=(
    "font-ubuntu-mono-powerline"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i="", tmp=""

    # XCode Command Line Tools
    if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
        xcode-select --install &> /dev/null

        # Wait until the XCode Command Line Tools are installed
        while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
            sleep 5
        done
    fi

    print_success "XCode Command Line Tools\n"

    # Homebrew
    if [ $(cmd_exists "brew") -eq 1 ]; then
        printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        #  └─ simulate the ENTER keypress
        print_result $? "brew"
    fi

    if [ $(cmd_exists "brew") -eq 0 ]; then

        execute "brew update" "brew (update)"
        execute "brew upgrade" "brew (upgrade)"
        execute "brew cleanup" "brew (cleanup)"

        # Homebrew Taps
        for i in ${!HOMEBREW_TAPS[*]}; do
            tmp="${HOMEBREW_TAPS[$i]}"
            execute "brew tap $tmp" "$tmp"
        done

        # Homebrew formulae
        for i in ${!HOMEBREW_FORMULAE[*]}; do
            tmp="${HOMEBREW_FORMULAE[$i]}"
            [ $(brew list "$tmp" &> /dev/null; printf $?) -eq 0 ] \
                && print_success "$tmp" \
                || execute "brew install $tmp" "$tmp"
        done

        printf "\n"

        # Homebrew casks
        if [ $(brew list brew-cask &> /dev/null; printf $?) -eq 0 ]; then

            for i in ${!HOMEBREW_CASKS[*]}; do
                tmp="${HOMEBREW_CASKS[$i]}"
                [ $(brew cask list "$tmp" &> /dev/null; printf $?) -eq 0 ] \
                    && print_success "$tmp" \
                    || execute "brew cask install $tmp" "$tmp"
            done

            printf "\n"

            # Homebrew alternate casks
            brew tap caskroom/versions &> /dev/null

            if [ $(brew tap | grep "caskroom/versions" &> /dev/null; printf $?) -eq 0 ]; then
                for i in ${!HOMEBREW_ALTERNATE_CASKS[*]}; do
                    tmp="${HOMEBREW_ALTERNATE_CASKS[$i]}"
                    [ $(brew cask list "$tmp" &> /dev/null; printf $?) -eq 0 ] \
                        && print_success "$tmp" \
                        || execute "brew cask install $tmp" "$tmp"
                done
            fi
            # Homebrew fonts casks
            brew tap caskroom/fonts &> /dev/null

            if [ $(brew tap | grep "caskroom/versions" &> /dev/null; printf $?) -eq 0 ]; then
                for i in ${!HOMEBREW_FONT_CASKS[*]}; do
                    tmp="${HOMEBREW_FONT_CASKS[$i]}"
                    [ $(brew cask list "$tmp" &> /dev/null; printf $?) -eq 0 ] \
                        && print_success "$tmp" \
                        || execute "brew cask install $tmp" "$tmp"
                done
            fi
        fi

    fi

}

main
