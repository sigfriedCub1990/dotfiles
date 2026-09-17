function fish_user_key_bindings --description 'Extra bindings, applied after fish installs the vi preset'
    # fzf.fish: move the file/directory widget to ctrl-t (zsh muscle memory).
    # Widgets not named here keep their defaults:
    #   ctrl-r history, ctrl-alt-l git log, ctrl-alt-s git status,
    #   ctrl-alt-p processes, ctrl-v variables
    fzf_configure_bindings --directory=ctrl-t

    # Edit the current command line in $EDITOR (zsh: bindkey -M vicmd '^e')
    # fish also offers this on alt-e / alt-v out of the box
    bind -M default ctrl-e edit_command_buffer
    bind -M insert ctrl-e edit_command_buffer
end
