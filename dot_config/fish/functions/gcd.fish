function gcd --description 'git clone the URL in the clipboard and cd into it'
    set -l url (clippaste)
    set -l dir (string replace -r '\.git$' '' (basename -- $url))
    git clone $url
    and cd $dir
end
