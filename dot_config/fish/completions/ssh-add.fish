# Migrated from ~/.config/zsh/confs/completions/_ssh-add
# Complete key files from ~/.ssh instead of the whole filesystem
complete -c ssh-add -f -a "(path filter -f ~/.ssh/* | string match -v -r '(known_hosts|config|authorized_keys|\.pub\$)')"
complete -c ssh-add -s l -d 'List fingerprints of loaded keys'
complete -c ssh-add -s L -d 'List public key parameters of loaded keys'
complete -c ssh-add -s d -d 'Remove a key'
complete -c ssh-add -s D -d 'Remove all keys'
complete -c ssh-add -s K -d 'Load resident keys from a security key'
complete -c ssh-add -s t -x -d 'Lifetime for the key'
