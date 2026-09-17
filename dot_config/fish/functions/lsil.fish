function lsil --wraps eza --description 'Long listing sorted by extension, directories first'
    eza -ls Extension -b --group-directories-first $argv
end
