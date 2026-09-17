function fe --description 'fuzzy-find file(s) and open them in $EDITOR (tab to multi-select)'
    set -l files (fzf-tmux --query=$argv[1] --multi --select-1 --exit-0)
    test -n "$files[1]"; or return 1

    set -l editor $EDITOR
    test -n "$editor"; or set editor nvim
    $editor $files
end
