#!/usr/bin/env fish

set -e

set -A files_to_move \
    "$HOME/player/mpd.conf" "$HOME/.config/mpd" \
    "$HOME/player/database" "$HOME/.config/mpd" \
    "$HOME/player/config" "$HOME/.config/ncmpcpp" \
    "$HOME/player/*.mp3" "$HOME/Music"

set directories \
    "$HOME/.config/mpd" \
    "$HOME/.config/ncmpcpp" \
    "$HOME/Music"

function create_directories
    for dir in $directories
        mkdir -p $dir
    end
end

function move_files
    for i in (seq 1 2 (count $files_to_move))
        set src (echo $files_to_move[$i])
        set dest (echo $files_to_move[$i+1])
        mv $src $dest
    end
end

function main
    create_directories
    move_files
end

main

exit 0
