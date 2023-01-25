#! /bin/bash

# List Mind Maps and allow you to select one
# using fzf to filter
function mm() {
	if [[ $1 ]]; then
		/usr/bin/ls --ignore="*.md" ~/mind_maps | fzf --height=50% --border=horizontal --border-label="Mind Maps" --color=label:bold:green --layout=reverse --bind "enter:execute(h-m-m ~/mind_maps/{})" --cycle --query="$1"
	else
		/usr/bin/ls --ignore="*.md" ~/mind_maps | fzf --height=50% --border=horizontal --border-label="Mind Maps" --color=label:bold:green --layout=reverse --bind "enter:execute(h-m-m ~/mind_maps/{})" --cycle
	fi
}

# Creates a new Mind Map if
# it doesn't exist
function cmm() {
	if [[ ! -e "$HOME/mind_maps/$1.hmm" ]]; then
		touch "$HOME/mind_maps/$1.hmm"
		h-m-m "$HOME/mind_maps/$1.hmm"
	else
		mm "$1"
	fi
}
