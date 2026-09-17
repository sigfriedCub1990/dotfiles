function gmf --description 'Open modified files on this branch using fzf'
    set -l repo_root (git rev-parse --show-toplevel) || return 1

    set -l selected (git diff --name-only master... \
      | fzf --multi \
            --preview "git -C $repo_root diff master... --color=always -- {}")

    if test -n "$selected"
      nvim $repo_root/$selected
    end
end
