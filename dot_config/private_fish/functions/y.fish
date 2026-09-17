function y --wraps yazi --description 'Launch yazi and cd into the last directory on exit'
    set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z -l cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and [ -d "$cwd" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
