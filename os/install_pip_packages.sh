#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" && source "utils.sh"

declare -r -a PIP_PACKAGES=(
    "virtualenv"
    "virtualenvwrapper"
    "neovim"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # Install the `npm` packages
    for i in ${PIP_PACKAGES[@]}; do
        execute "pip install $i" "$i"
    done

}

main
