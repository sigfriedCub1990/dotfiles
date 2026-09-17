function fns --description 'Pick an npm script with fzf and run it'
    set -l script (jq -r '.scripts | keys[]' package.json | sort | fzf)
    test -n "$script" && npm run $script
end
