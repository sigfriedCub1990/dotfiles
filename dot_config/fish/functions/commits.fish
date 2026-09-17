function commits --description 'List commit hashes, oldest first'
    git log $argv --oneline --reverse | cut -d' ' -f1 | tr '\n' ' '
end
