function fcs --description 'Pick a commit with fzf and print its sha'
    git log --color=always --pretty=oneline --abbrev-commit --reverse \
        | fzf --tac +s +m -e --ansi --reverse \
        | string split -m1 ' ' | head -1
end
