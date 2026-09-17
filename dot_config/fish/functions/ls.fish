function ls --wraps ls --description 'ls with colours (zsh alias: ls --color=always)'
    # --color=auto instead of always, so piping ls output stays clean
    command ls --color=auto $argv
end
