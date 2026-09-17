function lga --wraps eza --description 'Grid listing sorted by extension, directories first'
    eza -Gs Extension -b --group-directories-first $argv
end
