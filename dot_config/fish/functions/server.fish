function server --description 'Serve the current directory over HTTP and open it'
    set -l port $argv[1]
    test -z "$port" && set port 8000

    fish -c "sleep 1; openurl http://localhost:$port" &
    python -m http.server $port
end
