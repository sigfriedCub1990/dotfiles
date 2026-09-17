# Login-only actions: fish port of the end of ~/.config/shell/profile.
# Sorts after 00-env.fish, so the environment is ready, and before the
# plugins and config.fish, so on tty1 X starts without loading any of them.

# Linux-only: chezmoi ignores this file elsewhere (see .chezmoiignore).
# The guard is belt-and-braces, matching 05-darwin.fish / 05-linux.fish:
# macOS terminals DO start login shells, so a stray copy must not run.
test (uname) = Linux; or return

# Not a login shell (terminals, scripts)? Stop reading this file.
status is-login; or return

# Generate bookmark shortcut files (lf, nvim, zsh) if they don't exist yet.
test -f $XDG_CONFIG_HOME/shell/shortcutrc
or setsid -f shortcuts >/dev/null 2>&1

# On the tty1 console, with no X server running, replace this shell with X.
# Terminals inside X report /dev/pts/N here, even though they inherit
# XDG_VTNR=1 from the session, so they never match.
if test "$(tty)" = /dev/tty1; and not pidof -s Xorg >/dev/null
    exec startx $XINITRC
end

# Only reached on other consoles: swap Caps Lock and Escape.
sudo -n loadkeys $XDG_DATA_HOME/larbs/ttymaps.kmap 2>/dev/null
