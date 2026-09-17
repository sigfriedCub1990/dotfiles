function gbf --description 'Pick branches (local and remote) with fzf and print their names'
    __fish_is_git_repository || return 1

    git branch -a --color=always | grep -v '/HEAD\s' | sort \
        | _fzf_down --ansi --multi --tac --preview-window right:70% \
            --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" (echo {} | sed s/^..// | cut -d" " -f1) | head -'$LINES \
        | sed 's/^..//' | cut -d' ' -f1 | sed 's#^remotes/##'
end
