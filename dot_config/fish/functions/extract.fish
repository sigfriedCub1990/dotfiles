function extract --description 'Extract an archive. extract [-r|--remove] <file...>'
    argparse r/remove -- $argv
    or return

    if test (count $argv) -eq 0
        echo "Usage: extract [-r|--remove] [file ...]"
        echo
        echo Options:
        echo "    -r, --remove    Remove archive after extracting."
        return 1
    end

    for file in $argv
        if not test -f "$file"
            echo "extract: '$file' is not a valid file" >&2
            continue
        end

        set -l dir (string replace -r '\.[^.]*$' '' (basename -- $file))
        set -l ok true

        switch $file
            case '*.tar.gz' '*.tgz'
                command -q pigz && pigz -dc $file | tar xv || tar zxvf $file
            case '*.tar.bz2' '*.tbz' '*.tbz2'
                tar xvjf $file
            case '*.tar.xz' '*.txz'
                tar --xz -xvf $file
            case '*.tar.lzma' '*.tlz'
                tar --lzma -xvf $file
            case '*.tar'
                tar xvf $file
            case '*.gz'
                command -q pigz && pigz -d $file || gunzip $file
            case '*.bz2'
                bunzip2 $file
            case '*.xz'
                unxz $file
            case '*.lzma'
                unlzma $file
            case '*.Z'
                uncompress $file
            case '*.zip' '*.war' '*.jar' '*.sublime-package'
                unzip $file -d $dir
            case '*.rar'
                unrar x -ad $file
            case '*.7z'
                7za x $file
            case '*.deb'
                mkdir -p $dir/control $dir/data
                set -l abs (realpath $file)
                pushd $dir
                ar vx $abs >/dev/null
                tar xzvf control.tar.gz -C control
                tar xzvf data.tar.gz -C data
                /bin/rm -f ./*.tar.gz debian-binary
                popd
            case '*'
                echo "extract: '$file' cannot be extracted" >&2
                set ok false
        end

        test "$ok" = true; and set -q _flag_remove; and /bin/rm -- $file
    end
end
