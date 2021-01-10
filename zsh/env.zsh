export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim

export GO_PATH=$PATH:/$HOME/go/bin
export RUBY_PATH=$PATH:/$HOME/.gem/ruby/2.7.0/bin

export LANG=en_US.UTF-8
export PATH=$PATH:$GO_PATH:$RUBY_PATH

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Colorls
source $(dirname $(gem which colorls))/tab_complete.sh
