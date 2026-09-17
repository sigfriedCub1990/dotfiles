function tm --description 'attach/switch to tmux session NAME (created if missing); no NAME: pick one with fzf'
    # Inside tmux, attaching would nest tmux; switch the current client instead.
    set -l change attach-session
    set -q TMUX; and set change switch-client

    if set -q argv[1]
        set -l name $argv[1]
        # "=NAME" matches exactly; a plain "-t NAME" also matches prefixes.
        if not tmux has-session -t "=$name" 2>/dev/null
            tmux new-session -d -s $name; or return
        end
        tmux $change -t "=$name"
        return
    end

    set -l sessions (tmux list-sessions -F '#{session_name}' 2>/dev/null)
    if not set -q sessions[1]
        echo 'tm: no tmux sessions yet; create one with: tm NAME' >&2
        return 1
    end

    # set keeps the exit status of the command substitution, so Esc in fzf returns here.
    set -l session (printf '%s\n' $sessions | fzf); or return
    tmux $change -t "=$session"
end
