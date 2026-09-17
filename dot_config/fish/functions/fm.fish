function fm --description 'Pick a commit with fzf and check it out'
    set -l sha (fcs)
    test -n "$sha" && git checkout $sha
end
