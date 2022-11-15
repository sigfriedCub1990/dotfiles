#! /bin/bash
# Opens a Mind Map file, or
# the default one
function mm() {
	if [ -n "$1" ]; then
		h-m-m "$HOME/mind_maps/$1.hmm"
	else
		h-m-m "$HOME/mind_maps/mindmap.hmm"
	fi
}

# Creates a new Mind Map if
function cmm() {
	if [[ ! -e "$HOME/mind_maps/$1.hmm" ]]; then
		touch "$HOME/mind_maps/$1.hmm"
		h-m-m "$HOME/mind_maps/$1.hmm"
	else
		echo "A Mind Map with name $1 already exists."
	fi
}
