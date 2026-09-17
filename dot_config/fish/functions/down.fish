function down --description 'Download a URL into the current directory'
    curl -O $argv[1]
end
