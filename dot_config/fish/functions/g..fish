function g. --description 'cd to the root of the git repository, or one level up if there is none'
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    if test -n "$root"
        cd $root
    else
        cd ..
    end
end
