function find_empty --description 'List empty files and directories below the current one'
    for file in (find . -type f)
        test (wc -w < $file) -eq 0 && echo "file - $file"
    end
    for dir in (find . -type d -empty)
        echo "dir - $dir"
    end
end
