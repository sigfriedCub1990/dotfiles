function ssh --wraps ssh --description 'ssh with a TERM that remote hosts know'
    # Remote machines usually lack terminfo for xterm-ghostty.
    TERM=xterm-256color command ssh $argv
end
