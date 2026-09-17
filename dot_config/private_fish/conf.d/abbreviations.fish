# Abbreviations: port of ~/.config/zsh/confs/aliases.zsh (+ a few from aliasrc).
# Unlike aliases they expand in the command line when you press space/enter,
# so history holds the real command. Only typed commands need them.
status is-interactive; or return

# Navigation
abbr -a ..1 'cd ..'
abbr -a ..2 'cd ../..'
abbr -a ..3 'cd ../../..'
abbr -a ..4 'cd ../../../..'
abbr -a mkd 'mkdir -pv'
abbr -a cx 'chmod +x'

# Safer defaults
abbr -a rm 'rm -vi'

# Editors and viewers
abbr -a e '$EDITOR'
abbr -a v '$EDITOR'
abbr -a cat bat
abbr -a zt 'zathura --fork'
abbr -a lsc 'ls -lhc --sort=extension'

# Tools
abbr -a g git
abbr -a top btop
abbr -a dco docker-compose
abbr -a cm chezmoi
abbr -a nb newsboat
abbr -a ssh-ls 'ssh-add -l'
abbr -a ssh-remove 'ssh-add -D'
abbr -a icat 'kitty +kitten icat'
abbr -a hg 'kitty +kitten hyperlinked_grep'
