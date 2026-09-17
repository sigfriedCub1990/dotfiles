# macOS-only configuration.
# chezmoi ignores this file on every other OS (see .chezmoiignore).
# The guard is belt-and-braces: conf.d is sourced by directory scan, so a stray
# copy on the wrong OS would otherwise shadow the correct definitions.
test (uname) = Darwin; or return

# --- PATH ---
# Google Cloud SDK ships its own fish path snippet
if test -f $HOME/Downloads/google-cloud-sdk/path.fish.inc
    source $HOME/Downloads/google-cloud-sdk/path.fish.inc
end

fish_add_path -ga $HOME/develop/flutter/bin
fish_add_path -ga /Applications/Obsidian.app/Contents/MacOS

# --- OS primitives ---
# Defined here rather than in functions/ because fish autoloads
# functions/*.fish by filename, so an OS-suffixed filename would never load.

function clipcopy --description 'Copy stdin to the clipboard'
    pbcopy
end

function clippaste --description 'Print the clipboard contents'
    pbpaste
end

function openurl --description 'Open a URL or file with the desktop handler'
    open $argv
end

# --- Abbreviations ---
status is-interactive; or return

# kitty kittens (kitty is not on PATH; called through the app bundle)
abbr -a icat '/Applications/kitty.app/Contents/MacOS/kitty +kitten icat'
abbr -a hg '/Applications/kitty.app/Contents/MacOS/kitty +kitten hyperlinked_grep'
