function gri --description 'Stop tracking files and remove them'
    git rm $argv
    git rm --cached $argv
end
