function fah --description 'Pick a directory with fzf (hidden ones included) and cd into it'
    set -l base $argv[1]
    test -z "$base" && set base .
    set -l dir (find $base -type d 2>/dev/null | fzf +m)
    test -n "$dir" && cd $dir
end
