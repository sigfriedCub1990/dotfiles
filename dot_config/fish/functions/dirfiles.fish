function dirfiles --description 'Count the files inside a directory, recursively'
    find $argv[1] -type f | count
end
