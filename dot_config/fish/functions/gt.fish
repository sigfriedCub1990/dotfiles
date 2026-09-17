function gt --description 'Pick git tags with fzf'
    __fish_is_git_repository || return 1

    git tag --sort -version:refname \
        | _fzf_down --multi --preview-window right:70% \
            --preview 'git show --color=always {} | head -'$LINES
end
