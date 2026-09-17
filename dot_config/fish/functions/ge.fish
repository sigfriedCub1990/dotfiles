function ge --description 'Check out a branch, picking it with fzf when no name is given'
    if test (count $argv) -gt 0
        git checkout $argv
        return
    end

    set -l branch (git branch -vv | fzf +m | string trim | string replace -r '^\*?\s*' '' | string split -m1 ' ' | head -1)
    test -n "$branch" && git checkout $branch
end
