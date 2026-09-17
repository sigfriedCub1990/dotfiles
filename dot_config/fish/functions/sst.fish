function sst --description 'Attach to a tmux session over ssh'
    if test (count $argv) -lt 2
        echo "Usage: sst <host> <tmux session>"
        return 1
    end
    command ssh -t $argv[1] "tmux attach -t '$argv[2]'"
end
