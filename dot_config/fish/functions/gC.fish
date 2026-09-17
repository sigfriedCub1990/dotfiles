function gC --description 'Browse commits with fzf (fzf.fish also offers this on ctrl-alt-l)'
    git log --graph --color=always --format='%C(auto)%h%d %s %C(black)%C(bold)%cr' $argv \
        | fzf --ansi --no-sort --reverse --tiebreak=index \
            --preview 'echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % git show --color=always %' \
            --preview-window=right:60% \
            --bind 'j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort' \
            --bind 'enter:execute(echo {} | grep -o "[a-f0-9]\{7\}" | head -1 | xargs -I % sh -c "git show --color=always % | less -R")'
end
