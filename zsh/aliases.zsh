#!/bin/bash

alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias clear='clear && printf "\e[3J"'
alias ls='exa -lhFs Extension -b --group-directories-first --git'
alias la='exa -lahFs Extension -b --group-directories-first'
alias lt='ls -T --git-ignore'
alias lga='ls -GFs Extension -b --group-directories-first'
alias lsil='ls -lFs Extension -b --group-directories-first'
alias lsc='ls -lFhc --sort=extension'
alias top='btop'
alias rm='rm -vi'
#Configuration files.
alias vimr='vim ~/.vimrc'
#VirtualEnvs
alias activate='. env/bin/activate'

# Lazy stuff
alias lzd="lazydocker"
alias lg="lazygit"

alias ssh-ls="ssh-add -l"
alias ssh-remove="ssh-add -D"
alias ssh="TERM=xterm-256color ssh"
alias cat="bat"
alias n="nvim"
alias g="git"
alias dco="docker-compose"
alias zt="zathura"
alias pes="pipenv shell"
alias cx="chmod +x "

# RSS reader
alias nb="newsboat"

# fasd aliases
alias v='f -e nvim'     # quick opening files with vim
alias m='f -e mplayer'  # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open

# vim: set filetype=sh :
