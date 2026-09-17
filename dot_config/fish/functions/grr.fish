function grr --description 'Pick a git remote with fzf'
    __fish_is_git_repository || return 1

    git remote -v | awk '{print $1 "\t" $2}' | uniq \
        | _fzf_down --tac \
            --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' \
        | cut -d\t -f1
end
