# Environment shared by every machine.
# Every fish process loads this (login, interactive and scripts), and it runs
# before 10-login.fish starts X, so X inherits everything set here.
# OS-specific variables live in 05-darwin.fish / 05-linux.fish.
# Keep it cheap and safe to run more than once.

# --- XDG base directories ---------------------------------------------------
# First, because later lines are built from them.
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# --- Editors ----------------------------------------------------------------
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim

# --- Man pages --------------------------------------------------------------
set -gx MANWIDTH 80
# Quoted: one element. Unquoted it would be a 2-element list.
set -gx MANPAGER 'nvim +Man!'

# --- Locale -----------------------------------------------------------------
# macOS has no /etc/locale.conf, so set it here rather than relying on the OS.
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

# --- ~/ clean-up: point programs at XDG directories -------------------------
set -gx ZDOTDIR $XDG_CONFIG_HOME/zsh # keeps zsh usable as a fallback
set -gx HISTFILE $XDG_DATA_HOME/history # for bash/zsh; fish ignores it
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history

# --- fzf --------------------------------------------------------------------
# Key bindings come from the fzf.fish plugin (see fish_user_key_bindings).
# FZF_CTRL_T_COMMAND is intentionally unset: only fzf's own shell integration
# reads it, and we don't load that.
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!.git'"
set -gx FZF_DEFAULT_OPTS "--layout=reverse-list --height=40% --cycle --highlight-line"

# What fzf.fish's file search (ctrl-t) passes to fd: show dotfiles, but never
# the contents of .git. Same idea as the --hidden --glob '!.git' above.
# A fish variable, not an environment one: fzf.fish reads it directly.
set -g fzf_fd_opts --hidden --exclude=.git

# --- bat --------------------------------------------------------------------
# Also used by fzf.fish previews, so it belongs in the environment rather than
# as a flag on the `cat` abbreviation.
set -gx BAT_THEME gruvbox-dark

# --- less -------------------------------------------------------------------
# Used for bold/underline, e.g. in git and less itself.
# \e is only an escape when UNQUOTED, so it sits outside the quotes.
set -gx LESS R
set -gx LESS_TERMCAP_mb \e'[1;31m' # blink     -> bold red
set -gx LESS_TERMCAP_md \e'[1;36m' # bold      -> bold cyan
set -gx LESS_TERMCAP_me \e'[0m' #    end bold/blink
set -gx LESS_TERMCAP_so \e'[01;44;33m' # standout -> yellow on blue
set -gx LESS_TERMCAP_se \e'[0m' #    end standout
set -gx LESS_TERMCAP_us \e'[1;32m' # underline -> bold green
set -gx LESS_TERMCAP_ue \e'[0m' #    end underline
