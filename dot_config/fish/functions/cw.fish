function cw --description 'Copy the working directory to the clipboard'
    printf '%s' $PWD | clipcopy
end
