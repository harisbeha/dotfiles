#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" && source "utils.sh"

declare -a DIRECTORIES=(
    "$HOME/archive"
    "$HOME/Downloads/torrents"
    "$HOME/Documents/projects"
    "$HOME/.vim/undos"
    "$HOME/.vim/swaps"
    "$HOME/.vim/backups"
)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
    for i in ${DIRECTORIES[@]}; do
        mkdir -p "$i"
    done
}

main
