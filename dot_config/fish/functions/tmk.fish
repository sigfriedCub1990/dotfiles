function tmk --description 'Pick tmux sessions with fzf and kill them'
    set -l sessions (tmux list-sessions -F '#{session_name}' 2>/dev/null | fzf --exit-0 --multi)
    or return

    for session in $sessions
        echo "Killing $session"
        tmux kill-session -t $session
    end
end
