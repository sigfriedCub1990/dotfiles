function f --description 'Navigate files directory tree using fzf'
    command fd --type directory | fzf --multi --height=80% --border=sharp --exit-0 \
    --preview='tree -C {}' --preview-window='45%,border-sharp' \
    --prompt='Dirs > ' \
    --bind='enter:execute($EDITOR {+})' \
    --bind='del:execute(rm -ri {+})' \
    --bind='ctrl-p:toggle-preview' \
    --bind='ctrl-d:change-prompt(Dirs > )' \
    --bind='ctrl-d:+reload(fd --type directory)' \
    --bind='ctrl-d:+change-preview(tree -C {})' \
    --bind='ctrl-d:+refresh-preview' \
    --bind='ctrl-f:change-prompt(Files > )' \
    --bind='ctrl-f:+reload(fd --type file)' \
    --bind='ctrl-f:+change-preview(cat {})' \
    --bind='ctrl-f:+refresh-preview' \
    --bind='ctrl-a:select-all' \
    --bind='ctrl-x:deselect-all' \
    --header '
    CTRL-D to display directories | CTRL-F to display files
    CTRL-A to select all | CTRL-x to deselect all
    ENTER to edit | DEL to delete
    CTRL-P to toggle preview
    '
end
