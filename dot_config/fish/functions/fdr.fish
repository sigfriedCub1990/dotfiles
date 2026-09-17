function fdr --description 'Pick one of the current directory parents and cd into it'
    set -l start $argv[1]
    test -z "$start" && set start $PWD

    set -l dirs
    set -l dir (realpath $start)
    while true
        set -a dirs $dir
        test "$dir" = / && break
        set dir (dirname -- $dir)
    end

    set -l chosen (printf '%s\n' $dirs | fzf --tac)
    test -n "$chosen" && cd $chosen
end
