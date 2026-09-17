function fkil --description 'Pick processes with fzf and kill them'
    set -l signal $argv[1]
    test -z "$signal" && set signal 9

    set -l pids (ps -ef | sed 1d | fzf -m | awk '{print $2}')
    test -n "$pids" && kill -$signal $pids
end
