function mm --description 'List mind maps and open the one picked with fzf'
    set -l mm_dir ~/mind_maps

    if test -n "$argv[1]" -a -e "$mm_dir/$argv[1].hmm"
        h-m-m $mm_dir/$argv[1].hmm
        return
    end

    command ls -R $mm_dir | string match -r '.*hmm$' \
        | fzf --height=50% --border=horizontal --border-label="Mind Maps" \
            --color=label:bold:green --layout=reverse --cycle \
            --query="$argv[1]" \
            --bind "enter:become(h-m-m $mm_dir/{})"
end
