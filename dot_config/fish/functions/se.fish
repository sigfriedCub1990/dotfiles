function se --description 'Pick a script in ~/.local/bin with fzf and open it in $EDITOR'
    set -l dir $HOME/.local/bin
    test -d $dir; or return 1

    # `find -printf` is GNU-only, so trim the prefix with string replace instead.
    set -l choice (find $dir -type f | string replace "$dir/" '' | fzf); or return

    set -l editor $EDITOR
    test -n "$editor"; or set editor nvim
    $editor $dir/$choice
end
