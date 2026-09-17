function l --wraps eza --description 'Long listing, directories first, with git status'
    eza -lhs Extension -b --group-directories-first --git $argv
end
