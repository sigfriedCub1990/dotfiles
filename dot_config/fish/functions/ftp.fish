function ftp --description 'Pick test files with fzf and run pytest on them'
    set -l files (fzf-tmux --query="test_" --multi --select-1 --exit-0)
    test -n "$files" && pytest $files
end
