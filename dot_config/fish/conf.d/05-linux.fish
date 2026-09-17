# Linux-only configuration: the fish port of ~/.config/shell/profile + .zshenv.
# chezmoi ignores this file on every other OS (see .chezmoiignore).
# The guard is belt-and-braces: conf.d is sourced by directory scan, so a stray
# copy on the wrong OS would otherwise shadow the correct definitions.
# Sourced after 00-env.fish (so $XDG_* exist) and after 01-path.fish.
test (uname) = Linux; or return

# --- PATH -------------------------------------------------------------------
# --path edits $PATH directly (no universal fish_user_paths).
# Missing directories are skipped, and existing entries are never duplicated.

# Must win over system versions: prepend, and --move them to the front
# even if an inherited PATH already contains them further back.
fish_add_path --path --move --prepend $XDG_DATA_HOME/cargo/bin $HOME/flutter/bin

# bash/zsh get this from /etc/profile.d/jre.sh; fish never reads that.
fish_add_path --path --append /usr/lib/jvm/default/bin

# Personal scripts, including subdirectories (cron/, statusbar/).
fish_add_path --path --append (find $HOME/.local/bin -type d)

fish_add_path --path --append $XDG_DATA_HOME/go/bin $HOME/.fly/bin

# --- Toolchains re-homed under XDG ------------------------------------------
# macOS keeps cargo/go at their defaults instead (conf.d/01-path.fish).
set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOMODCACHE $XDG_CACHE_HOME/go/mod
set -gx FLYCTL_INSTALL $HOME/.fly

# --- Default programs -------------------------------------------------------
set -gx TERMINAL st
set -gx TERMINAL_PROG st
set -gx BROWSER firefox-developer-edition

# --- ~/ clean-up: point programs at XDG directories -------------------------
set -gx XINITRC $XDG_CONFIG_HOME/x11/xinitrc
set -gx NOTMUCH_CONFIG $XDG_CONFIG_HOME/notmuch-config
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0
set -gx WGETRC $XDG_CONFIG_HOME/wget/wgetrc
set -gx INPUTRC $XDG_CONFIG_HOME/shell/inputrc
set -gx WINEPREFIX $XDG_DATA_HOME/wineprefixes/default
set -gx KODI_DATA $XDG_DATA_HOME/kodi
set -gx PASSWORD_STORE_DIR $XDG_DATA_HOME/password-store
set -gx ANDROID_SDK_HOME $XDG_CONFIG_HOME/android
set -gx ANSIBLE_CONFIG $XDG_CONFIG_HOME/ansible/ansible.cfg
set -gx UNISON $XDG_DATA_HOME/unison
set -gx MBSYNCRC $XDG_CONFIG_HOME/mbsync/config
set -gx ELECTRUMDIR $XDG_DATA_HOME/electrum

# Set by pam_systemd at login. Only export if present, so we don't
# export an empty TMUX_TMPDIR in odd environments (env -i, cron, ...).
set -q XDG_RUNTIME_DIR; and set -gx TMUX_TMPDIR $XDG_RUNTIME_DIR

# --- Other program settings -------------------------------------------------
set -gx DICS /usr/share/stardict/dic/
set -gx SUDO_ASKPASS $HOME/.local/bin/dmenupass

# GUI toolkit fixes.
set -gx QT_QPA_PLATFORMTHEME gtk2 # Qt apps follow the GTK theme
set -gx MOZ_USE_XINPUT2 1 # Firefox smooth scrolling/touchpad
set -gx _JAVA_AWT_WM_NONREPARENTING 1 # Java windows blank under tiling WMs
# AWT_TOOLKIT dropped: the old value was a malformed mix of a variable and a
# command, and MToolkit (Motif) no longer exists in modern Java.

# --- OS primitives ----------------------------------------------------------
# Defined here rather than in functions/ because fish autoloads
# functions/*.fish by filename, so an OS-suffixed filename would never load.

function clipcopy --description 'Copy stdin to the clipboard'
    if command -q wl-copy
        wl-copy
    else if command -q xclip
        xclip -selection clipboard
    else if command -q xsel
        xsel --clipboard --input
    else
        echo "clipcopy: install wl-clipboard, xclip or xsel" >&2
        return 1
    end
end

function clippaste --description 'Print the clipboard contents'
    if command -q wl-paste
        wl-paste --no-newline
    else if command -q xclip
        xclip -selection clipboard -o
    else if command -q xsel
        xsel --clipboard --output
    else
        echo "clippaste: install wl-clipboard, xclip or xsel" >&2
        return 1
    end
end

function openurl --description 'Open a URL or file with the desktop handler'
    xdg-open $argv
end

# GNU coreutils ls. Overrides functions/ls.fish, which sticks to the flags
# BSD ls on macOS also understands; a definition here wins because fish only
# autoloads functions/ that are not already defined.
function ls --wraps ls --description 'ls with hyperlinks, colours and dirs first'
    # --color=auto, not always: colour codes would leak into pipes and files.
    command ls --hyperlink=auto --color=auto --group-directories-first $argv
end

# --- Abbreviations ----------------------------------------------------------
status is-interactive; or return

abbr -a zt 'zathura --fork'
abbr -a nb newsboat
# --sort=extension is GNU-only, so this one cannot live in 02-abbrs.fish.
abbr -a lsc 'ls -lhc --sort=extension'
