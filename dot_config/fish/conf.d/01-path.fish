# PATH shared across machines.
# mise, direnv and ~/.local/bin are already handled elsewhere
# (Homebrew/distro vendor_conf.d and uv's env.fish).
# OS-specific entries live in conf.d/05-darwin.fish / 05-linux.fish.

# cargo and go sit at their default locations here. The Linux box re-homes both
# under $XDG_DATA_HOME (conf.d/05-linux.fish), and that file is sourced after
# this one, so skip these there rather than adding paths that don't exist.
if test (uname) != Linux
    fish_add_path -ga $HOME/.cargo/bin

    # fish_add_path skips directories that do not exist yet, and ~/go/bin only
    # appears after the first `go install`, so add it by hand
    contains $HOME/go/bin $PATH; or set -gxa PATH $HOME/go/bin
end
