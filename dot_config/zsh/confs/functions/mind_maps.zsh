#! /bin/bash

# List Mind Maps and allow you to select one
# using fzf to filter
function mm() {
	MM_DIR=~/mind_maps
	INITIAL_QUERY=${1:-""} # Default to "" to display all files

	if [[ "$1" && -e "${MM_DIR}/$1.hmm" ]]; then
		h-m-m "$MM_DIR/$1.hmm"
	fi

	list_mind_maps | filter_results "$INITIAL_QUERY"
}

function list_mind_maps() {
	/usr/bin/ls -R --ignore="*.md" ~/mind_maps | grep --color=never 'hmm$'
}

function filter_results() {
	fzf --height=50% --border=horizontal --border-label="Mind Maps" --color=label:bold:green --layout=reverse --bind "enter:become(h-m-m ~/mind_maps/{})" --cycle --query=$1
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

#vim:ft=sh
