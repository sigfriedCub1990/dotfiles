function mdg --description 'Create a directory, cd into it and git init it'
    mkdir -p $argv[1]
    and cd $argv[1]
    and git init
end
