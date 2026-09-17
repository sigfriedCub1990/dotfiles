function compress --description 'Compress a file or directory. compress <path> [tar.bz2|tar.gz|gz|tar|zip]'
    set -l target $argv[1]
    set -l method $argv[2]

    if not test -e "$target"
        echo "'$target' is not a valid file/folder" >&2
        return 1
    end

    set -l prior $PWD
    set -l dir (dirname -- $target)
    set -l base (basename -- $target)

    cd $dir || return 1

    switch "$method"
        case tar.bz2
            tar cjf $base.tar.bz2 $base
        case tar.gz
            tar czf $base.tar.gz $base
        case gz
            test -d $base && gzip -r $base || gzip $base
        case tar
            tar -cvvf $base.tar $base
        case zip
            zip -r $base.zip $base
        case '*'
            echo "Method not passed, compressing using tar.bz2"
            tar cjf $base.tar.bz2 $base
    end

    cd $prior
    echo Done
end
