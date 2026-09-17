function fenv --description 'Search environment variables with fzf and print the value'
    set -l selected (env | fzf)
    test -n "$selected" && string split -m1 = -- $selected | tail -1
end
