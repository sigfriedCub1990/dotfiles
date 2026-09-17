function ft --description 'Browse git stashes with fzf. enter shows it, ctrl-d diffs it, ctrl-b branches it'
    __fish_is_git_repository || return 1

    while true
        set -l out (
            git stash list --pretty='%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs' \
                | fzf --ansi --no-sort --expect=ctrl-d,ctrl-b
        )
        or break

        set -l key $out[1]
        set -l sha (string split -m1 ' ' -- $out[2] | head -1)
        test -z "$sha" && break

        switch $key
            case ctrl-d
                git diff $sha
            case ctrl-b
                git stash branch "stash-$sha" $sha
                break
            case '*'
                git stash show -p $sha
        end
    end
end
