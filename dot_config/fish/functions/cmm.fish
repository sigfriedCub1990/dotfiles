function cmm --description 'Create a mind map if it does not exist yet, then open it'
    set -l file ~/mind_maps/$argv[1].hmm

    if test -e "$file"
        mm $argv[1]
    else
        touch $file
        h-m-m $file
    end
end
