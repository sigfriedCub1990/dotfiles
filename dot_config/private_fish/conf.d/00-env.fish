# Login environment: fish port of ~/.config/shell/profile and ~/.zshenv.
# Every fish process loads this (login, interactive and scripts), and it
# runs before 10-login.fish starts X, so X inherits everything set here.
# Keep it cheap and safe to run more than once.

# --- XDG base directories ---------------------------------------------------
# First, because later lines are built from them.
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# --- PATH ---------------------------------------------------------------------
# --path edits $PATH directly (no universal fish_user_paths).
# Missing directories are skipped, and existing entries are never duplicated.

# Must win over system versions: prepend, and --move them to the front
# even if an inherited PATH already contains them further back.
fish_add_path --path --move --prepend $XDG_DATA_HOME/cargo/bin $HOME/flutter/bin

# bash/zsh get this from /etc/profile.d/jre.sh; fish never reads that.
fish_add_path --path --append /usr/lib/jvm/default/bin

# Personal scripts, including subdirectories (cron/, statusbar/).
fish_add_path --path --append (find $HOME/.local/bin -type d)

# Previously only in interactive zsh (.zshrc / env.zsh).
fish_add_path --path --append $XDG_DATA_HOME/go/bin $HOME/.fly/bin

# --- Default programs ---------------------------------------------------------
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx TERMINAL st
set -gx TERMINAL_PROG st
set -gx BROWSER firefox-developer-edition

set -gx MANWIDTH 80
# Quoted: one element. Unquoted it would be a 2-element list.
set -gx MANPAGER 'nvim +Man!'

# LANG comes from /etc/locale.conf (fish reads it itself), so no locale lines.

# --- ~/ clean-up: point programs at XDG directories -------------------------
set -gx XINITRC $XDG_CONFIG_HOME/x11/xinitrc
set -gx NOTMUCH_CONFIG $XDG_CONFIG_HOME/notmuch-config
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc
set -gx INPUTRC $XDG_CONFIG_HOME/shell/inputrc
set -gx ZDOTDIR $XDG_CONFIG_HOME/zsh # keeps zsh usable as a fallback
set -gx WINEPREFIX $XDG_DATA_HOME/wineprefixes/default
set -gx KODI_DATA $XDG_DATA_HOME/kodi
set -gx PASSWORD_STORE_DIR $XDG_DATA_HOME/password-store
set -gx ANDROID_SDK_HOME $XDG_CONFIG_HOME/android
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/go/mod
set -gx ANSIBLE_CONFIG $XDG_CONFIG_HOME/ansible/ansible.cfg
set -gx UNISON $XDG_DATA_HOME/unison
set -gx HISTFILE $XDG_DATA_HOME/history # for bash/zsh; fish ignores it
set -gx MBSYNCRC $XDG_CONFIG_HOME/mbsync/config
set -gx ELECTRUMDIR $XDG_DATA_HOME/electrum
set -gx PYTHONSTARTUP $XDG_CONFIG_HOME/python/pythonrc
set -gx SQLITE_HISTORY $XDG_DATA_HOME/sqlite_history
set -gx FLYCTL_INSTALL $HOME/.fly

# Set by pam_systemd at login. Only export if present, so we don't
# export an empty TMUX_TMPDIR in odd environments (env -i, cron, ...).
set -q XDG_RUNTIME_DIR; and set -gx TMUX_TMPDIR $XDG_RUNTIME_DIR

# --- Other program settings ---------------------------------------------------
set -gx DICS /usr/share/stardict/dic/
set -gx BAT_THEME gruvbox-dark # also used by fzf.fish previews
set -gx SUDO_ASKPASS $HOME/.local/bin/dmenupass

# fzf: the values interactive zsh used (env.zsh), not the profile's.
# Double quotes outside, so the single quotes around '!.git' stay literal.
set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --glob '!.git'"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_DEFAULT_OPTS '--layout=reverse-list --height=40% --cycle --highlight-line'

# less colours (used for bold/underline, e.g. in git and less itself).
# \e is only an escape when UNQUOTED, so it sits outside the quotes.
set -gx LESS R
set -gx LESS_TERMCAP_mb \e'[1;31m' # blink     -> bold red
set -gx LESS_TERMCAP_md \e'[1;36m' # bold      -> bold cyan
set -gx LESS_TERMCAP_me \e'[0m' #    end bold/blink
set -gx LESS_TERMCAP_so \e'[01;44;33m' # standout -> yellow on blue
set -gx LESS_TERMCAP_se \e'[0m' #    end standout
set -gx LESS_TERMCAP_us \e'[1;32m' # underline -> bold green
set -gx LESS_TERMCAP_ue \e'[0m' #    end underline
# LESSOPEN dropped: it piped files through `highlight`, which isn't installed.

# GUI toolkit fixes.
set -gx QT_QPA_PLATFORMTHEME gtk2 # Qt apps follow the GTK theme
set -gx MOZ_USE_XINPUT2 1 # Firefox smooth scrolling/touchpad
set -gx _JAVA_AWT_WM_NONREPARENTING 1 # Java windows blank under tiling WMs
# AWT_TOOLKIT dropped: the old value was a malformed mix of a variable and a
# command, and MToolkit (Motif) no longer exists in modern Java.
