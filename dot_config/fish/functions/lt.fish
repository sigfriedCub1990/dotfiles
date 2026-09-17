function lt --wraps l --description 'Tree listing, honoring .gitignore'
    l -T --git-ignore $argv
end
