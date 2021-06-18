export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export GO_PATH=$PATH:/$HOME/go/bin
export RUBY_PATH=$PATH:/$HOME/.gem/ruby/2.7.0/bin
export PYENV_PATH="/$HOME/.pyenv/bin"
export PYENV_BIN_PATH="/$HOME/.local/bin"

export LANG=en_US.UTF-8
export PATH=$PYENV_PATH:$PYENV_BIN_PATH:$PATH:$GO_PATH:$RUBY_PATH

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
