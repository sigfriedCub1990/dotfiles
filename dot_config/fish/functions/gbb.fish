function gbb --description 'Check out a branch with fzf and delete the branch you were on'
    set -l previous (git symbolic-ref --short -q HEAD)
    set -l branch (git branch -vv | fzf +m | string trim | string replace -r '^\*?\s*' '' | string split -m1 ' ' | head -1)

    test -z "$branch" && return 1
    git checkout $branch || return 1

    test -n "$previous" -a "$previous" != "$branch" && git branch -D $previous
end
