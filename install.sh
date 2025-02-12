#!/bin/bash

set -e

declare -A files_to_move=(
    ["$HOME/player/mpd.conf"]="$HOME/.config/mpd"
    ["$HOME/player/database"]="$HOME/.config/mpd"
    ["$HOME/player/config"]="$HOME/.config/ncmpcpp"
    ["$HOME/player/*.mp3"]="$HOME/Music"
)

directories=(
    "$HOME/.config/mpd"
    "$HOME/.config/ncmpcpp"
    "$HOME/Music"
)

create_directories() {
    for dir in "${directories[@]}"; do
        mkdir -p "$dir"
    done
}

move_files() {
    for src in "${!files_to_move[@]}"; do
        dest="${files_to_move[$src]}"
        mv "$src" "$dest"
    done
}

main() {
    create_directories
    move_files
}

main

exit 0
