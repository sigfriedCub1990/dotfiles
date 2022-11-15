#!/bin/zsh

fpath=($DOTFILES/zsh/completions $fpath)

autoload edit-command-line
zle -N edit-command-line

# History
HISTSIZE=10000 # Lines of history to keep in memory for current session
HISTFILESIZE=10000 # Number of commands to save in the file
SAVEHIST=10000 # Number of history entries to save to disk
HISTFILE=~/.zsh_history # Where to save history to disk
HISTDUP=erase # Erase duplicates in the history file

# Options - `man zshoptions`
setopt HIST_IGNORE_DUPS          # Ignore duplicates
setopt APPEND_HISTORY            # Append history to the history file (no overwriting)
setopt SHARE_HISTORY             # Share history across terminals
setopt INC_APPEND_HISTORY        # Immediately append to the history file, not just when a term is killed
setopt EXTENDED_GLOB             # Use extended globbing syntax
setopt AUTO_CD                   # Auto change to a dir without typing cd
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Edit line in vim with e in Normal mode:
bindkey -M vicmd '^e' edit-command-line

# NOTE: This works on Arch Linux, should test on MacOS
if [ $(command -v "fzf") ]; then
    # shellcheck disable=SC1091
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
else
    bindkey '^R' history-incremental-search-backward
fi
