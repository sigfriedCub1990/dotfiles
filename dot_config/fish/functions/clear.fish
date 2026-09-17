function clear --description 'Clear the screen and the scrollback buffer'
    command clear
    printf '\e[3J'
end
