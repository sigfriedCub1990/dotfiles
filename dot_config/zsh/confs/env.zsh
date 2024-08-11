export VISUAL=nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export GO_PATH=$PATH:/$HOME/go/bin
export RUBY_PATH=$PATH:/$HOME/.gem/ruby/3.0.0/bin
export LOCAL_SCRIPTS=$PATH:/$HOME/.local/bin

export LANG=en_US.UTF-8
export PATH=$GO_PATH:$RUBY_PATH:$LOCAL_SCRIPTS:$PATH

export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi
