#!/bin/zsh

# This is completion's general form of the `context` (man zshcompsys)
# :completion:function:completer:command:argument:tag

# generate matches for all completions in a verbose way
zstyle ':completion:*' verbose yes

# forces zsh to realize new commands
zstyle ':completion:*' completer _extensions _complete _approximate

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# rehash if command not found (possibly recently installed)
zstyle ':completion:*' rehash true

# menu if nb items > 2
zstyle ':completion:*' menu select=2

# group commands by type
zstyle ':completion:*' group-name ''

# When completing files and folders list,
# list them with all their parameters like a `ls -lh`
zstyle ':completion:*' file-list all

# highlight command descriptions and
# corrections made to a command
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!-- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
