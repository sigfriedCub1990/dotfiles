function gi --description 'Fetch a .gitignore from gitignore.io. gi <lang,lang,...>'
    curl -sL https://www.toptal.com/developers/gitignore/api/(string join , $argv)
end
