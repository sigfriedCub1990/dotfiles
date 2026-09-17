function fl --description 'Find where some text appears in the current directory'
    grep -rnw . -e "$argv"
end
