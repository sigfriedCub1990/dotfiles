function fb --description 'Pick one of the 30 most recent branches with fzf and check it out'
    __fish_is_git_repository || return 1

    set -l branch (
        git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)' \
            | fzf +m
    )
    test -n "$branch" && git checkout $branch
end
