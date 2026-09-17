function ls --wraps ls --description 'ls with hyperlinks, colours and directories first'
    # --color=auto, not always: colour codes would leak into pipes and files.
    command ls --hyperlink=auto --color=auto --group-directories-first $argv
end
