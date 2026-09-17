function fdd --description 'Pick a file with fzf and cd into its directory'
    set -l file (fzf +m -q "$argv[1]")
    test -n "$file" && cd (dirname -- $file)
end
