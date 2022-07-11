alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias clear='clear && printf "\e[3J"'
alias ls='exa -lhFs Extension -b --group-directories-first'
alias lt='ls -T'
alias lga='ls -G'
alias lsil='ls -l'
alias lsc='ls -lFhC --sort=extension'
#Configuration files.
alias vimr='vim ~/.vimrc'
#VirtualEnvs
alias activate='. env/bin/activate'

alias ssh-ls="ssh-add -l"
alias ssh-remove="ssh-add -D"
alias ssh="TERM=xterm-256color ssh"
alias cat="bat"
alias n="nvim"
alias lzd="lazydocker"
alias g="git"
alias dco="docker-compose"
alias zt="zathura"
alias pes="pipenv shell"
alias cx="chmod +x "

# ExpressVPN aliases
alias vpn="expressvpn connect smart"
alias vpnc="expressvpn connect $1"
alias vpnd="expressvpn disconnect"
alias vpns="expressvpn status"

# vim: set filetype=sh :
