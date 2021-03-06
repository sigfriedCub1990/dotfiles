alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias clear='clear && printf "\e[3J"'
#alias ls='ls -lFh --sort=extension --color=auto'
#alias lc='ls -lhC --sort=extension --color=auto'
#Fanzy ls :)
alias ls='exa -lhFs Extension'
alias lsil='ls -l'
alias lsc='ls -lFhC --sort=extension'
#Configuration files.
alias vimr='vim ~/.vimrc'
#Directories navigation
alias dev='cd $HOME/develop/'
alias midgard='cd /media/sigfried/Midgard'
#VirtualEnvs
alias activate='. bin/activate'
alias workon='virtualenv'
alias workoff='deactivate'

alias ssh-ls="ssh-add -l"
alias ssh-remove="ssh-add -D"
alias ssh="TERM=xterm-256color ssh"
alias cat="bat"
alias n="nvim"
alias lzd="lazydocker"
alias g="glances"
# vim: set filetype=sh :
