# tm NAME<Tab>: complete with existing tmux session names (never files).
complete -c tm -f -a '(tmux list-sessions -F "#{session_name}" 2>/dev/null)' -d 'tmux session'
