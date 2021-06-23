#!/bin/bash
# see https://github.com/ryanoasis/nerd-fonts#patched-fonts for many fonts

# https://dev.to/captainsafia/what-the-heck-is-xdgdatahome-1il3
#mkdir -p $XDG_DATA_HOME/fonts
cp -f $DOTFILES/fonts/*.ttf $XDG_DATA_HOME/fonts/
