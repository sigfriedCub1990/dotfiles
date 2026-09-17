# Abbreviations — migrated from ~/.config/zsh/confs/aliases.zsh (+ aliasrc).
# Unlike aliases they expand in the command line when you press space/enter,
# so history holds the real command and scripts/pipes are unaffected.
#
# Shortcuts that take arguments are functions instead, so they get --wraps
# completions: see functions/{l,la,lt,lga,lsil,lg,lzd,n,e,v}.fish.
status is-interactive; or return

# Navigation
abbr -a ..1 'cd ..'
abbr -a ..2 'cd ../..'
abbr -a ..3 'cd ../../..'
abbr -a ..4 'cd ../../../..'
abbr -a mkd 'mkdir -pv'

# Core tools
abbr -a g git
abbr -a cat bat # theme comes from $BAT_THEME (conf.d/00-env.fish)
abbr -a top btop
abbr -a rm 'rm -vi'
abbr -a cx 'chmod +x'

# ssh keys
abbr -a ssh-ls 'ssh-add -l'
abbr -a ssh-remove 'ssh-add -D'

# Docker (compose v2 subcommand — docker-compose v1 is end-of-life)
abbr -a dco 'docker compose'

# Dotfiles
abbr -a cm chezmoi

# OS-specific abbreviations live in conf.d/05-darwin.fish / 05-linux.fish
