function showpath --description 'Print $PATH one entry per line'
    # Named showpath, not path: `path` is a fish builtin
    printf '%s\n' $PATH
end
