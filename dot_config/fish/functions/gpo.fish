function gpo --description 'Pull the current branch from origin'
    git pull origin (git symbolic-ref --short -q HEAD)
end
