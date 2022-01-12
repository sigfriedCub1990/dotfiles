export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export GO_PATH=$PATH:/$HOME/go/bin
export RUBY_PATH=$PATH:/$HOME/.gem/ruby/3.0.0/bin

export LANG=en_US.UTF-8
export PATH=$GO_PATH:$RUBY_PATH:$PATH

export FZF_DEFAULT_COMMAND="fd --type f"

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
