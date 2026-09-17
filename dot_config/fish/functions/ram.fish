function ram --description 'Show how much RAM the processes matching a pattern use'
    set -l app $argv[1]
    if test -z "$app"
        echo "Usage: ram <process-name pattern>"
        return 1
    end

    set -l sum 0
    for kb in (ps aux | grep -i -- $app | grep -v grep | awk '{print $6}')
        set sum (math $sum + $kb)
    end

    if test $sum -gt 0
        echo -s (set_color blue) $app (set_color normal) " uses " \
            (set_color green) (math -s2 $sum / 1024) (set_color normal) " MBs of RAM."
    else
        echo -s "No processes matching '" (set_color blue) $app (set_color normal) "' are running."
    end
end
