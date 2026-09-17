# Interactive setup. Runs last, after conf.d/ (environment, login, plugins).
# Only shells you type into need any of this, so scripts (`fish -c`,
# #!/usr/bin/fish) skip the whole block and start much faster.

if status is-interactive
    set -g fish_greeting

    # Vi mode. Setting the variable is the documented way: fish loads the vi
    # preset itself and then calls fish_user_key_bindings, where the extra
    # bindings live (functions/fish_user_key_bindings.fish).
    set -g fish_key_bindings fish_vi_key_bindings

    fish_config theme choose catppuccin-mocha

    # Key ownership is deliberate: the fzf.fish plugin owns ctrl-t (files),
    # ctrl-r (history), ctrl-alt-l/s/p/v. fzf's own shell integration
    # (`fzf --fish`) is NOT loaded, which is why FZF_CTRL_T_COMMAND stays
    # unset in conf.d/00-env.fish.

    zoxide init fish | source

    # mise and direnv normally hook themselves from vendor_conf.d (Homebrew on
    # macOS, the distro package on Linux), which is sourced before this file.
    # Activate only if that did not happen — e.g. installed via upstream's
    # script rather than a package — so the hook is never installed twice.
    if command -q mise; and not functions -q mise
        mise activate fish | source
    end
    if command -q direnv; and not functions -q __direnv_export_eval
        direnv hook fish | source
    end
end
