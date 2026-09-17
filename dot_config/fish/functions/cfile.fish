function cfile --description 'Copy the contents of a file to the clipboard'
    command cat $argv[1] | clipcopy
end
