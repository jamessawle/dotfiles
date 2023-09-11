#!/bin/zsh

# Create a Brewfile with $XDG_DATA_HOME/homebrew
# This will merge the default Brewfile with a local one if it is found
function createBrewfile() {
    if [ -f "$XDG_DATA_HOME/homebrew/Brewfile" ]; then
        rm "$XDG_DATA_HOME/homebrew/Brewfile"
    elif [ ! -d "$XDG_DATA_HOME/homebrew" ]; then
        mkdir "$XDG_DATA_HOME/homebrew"
    fi

    if [ -f "$XDG_CONFIG_HOME/custom/Brewfile" ]; then
        cat "$XDG_CONFIG_HOME/homebrew/Brewfile" "$XDG_CONFIG_HOME/custom/Brewfile"  > "$XDG_DATA_HOME/homebrew/Brewfile"
    else
        cp "$XDG_CONFIG_HOME/homebrew/Brewfile" "$XDG_DATA_HOME/homebrew/Brewfile"
    fi
}

function bbi() {
    createBrewfile && brew bundle --file "$XDG_DATA_HOME/homebrew/Brewfile" --no-lock
}

function bbc() {
    createBrewfile && brew bundle --file "$XDG_DATA_HOME/homebrew/Brewfile" cleanup --force 
}
