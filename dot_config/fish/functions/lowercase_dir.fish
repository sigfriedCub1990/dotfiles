function lowercase_dir --description 'Lowercase the name of every file in the current directory'
    for file in *
        set -l lower (string lower -- $file)
        test "$file" != "$lower" && mv -- $file $lower
    end
end
