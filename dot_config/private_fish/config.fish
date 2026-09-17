# Interactive setup. Runs last, after conf.d/ (environment, login, plugins).
# Only shells you type into need any of this, so scripts (`fish -c`,
# #!/usr/bin/fish) skip the whole block and start much faster.

if status is-interactive
    # Vi mode. Setting the variable is the documented way: fish loads the
    # vi preset itself, and the bindings added below sit on top of it.
    set -g fish_key_bindings fish_vi_key_bindings

    fish_config theme choose catppuccin-macchiato

    # Two fzf integrations, one owner per key:
    #   fzf.fish plugin: ctrl-t files/dirs (fd + preview), ctrl-alt-l git log,
    #                    ctrl-alt-s git status, ctrl-alt-p processes,
    #                    ctrl-alt-v variables (ctrl-v stays paste)
    #   fzf --fish:      ctrl-r history, alt-c cd, shift-tab completion
    # Must run BEFORE `fzf --fish`: it erases its old bindings by key, ctrl-r included.
    fzf_configure_bindings --history= --variables=ctrl-alt-v --directory=
    fzf --fish | source

    # What fzf.fish's file search passes to fd: show dotfiles, but never the
    # contents of .git (same idea as the old rg --files --hidden --glob '!.git').
    set -g fzf_fd_opts --hidden --exclude=.git

    # File search on ctrl-t only, using fzf.fish's picker (previews, token
    # replacement). Bound after `fzf --fish`, whose own ctrl-t it replaces.
    bind -M default ctrl-t _fzf_search_directory
    bind -M insert ctrl-t _fzf_search_directory

    zoxide init fish | source

    # Previously only in interactive zsh (.zshrc).
    mise activate fish | source
    direnv hook fish | source
end
