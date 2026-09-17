function fa --description 'Pick a directory with fzf and cd into it'
    set -l dir (find $argv[1] -path '*/.*' -prune -o -type d -print 2>/dev/null | fzf +m)
    test -n "$dir" && cd $dir
end
