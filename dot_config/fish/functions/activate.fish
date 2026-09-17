function activate --description "Activate Python's virtualenv if it exists"
    if path is venv
        source "./venv/bin/activate.fish"
    else if path filter -d .venv
        source "./.venv/bin/activate.fish"
    else
        echo "No virtualenv detected. Create one with `python -m venv venv`"
    end
end
