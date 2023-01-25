#!/usr/bin/bash

tmux kill-session -t scratchpad 2>/dev/null
alacritty --class alacritty_scratchpad,alacritty_scratchpad -e tmux new-session -d -s scratchpad ';' \
	attach-session -d -t scratchpad ';' \
	new-window -n nvim 'nvim +e /tmp/scratchpad.md +"set spelllang=es,en"' ';'
