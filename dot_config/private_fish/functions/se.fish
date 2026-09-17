function se --description 'pick a script in ~/.local/bin with fzf and open it in $EDITOR'
    set -l dir $HOME/.local/bin
    set -l choice (find $dir -type f -printf '%P\n' | fzf); or return
    $EDITOR $dir/$choice
end
