function gdelsquashed --description 'Delete local branches that were squash-merged into master'
    git checkout -q master || return 1
    for branch in (git for-each-ref refs/heads/ --format='%(refname:short)')
        test "$branch" = master && continue
        set -l base (git merge-base master $branch) || continue
        set -l tree (git rev-parse $branch^\{tree\})
        set -l commit (git commit-tree $tree -p $base -m _)
        if string match -q -- '-*' (git cherry master $commit)
            git branch -D $branch
        end
    end
end
