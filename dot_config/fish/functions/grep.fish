function grep --wraps grep --description 'grep with colours (zsh alias: grep --color=always)'
    # --color=auto instead of always, so piping grep output stays clean
    command grep --color=auto $argv
end
