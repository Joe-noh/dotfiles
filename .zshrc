# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wezm"

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump encode64 ruby rails bundle gem rbenv mix brew)

source $ZSH/oh-my-zsh.sh

setopt no_beep
setopt no_correct

unsetopt share_history

alias emacs="emacs -nw"
alias be="bundle exec"

export TERM=xterm-256color
export GOPATH="$HOME/Workspace"
export PATH="$GOPATH/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.exenv/bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

eval "$(rbenv init -)"
eval "$(exenv init -)"

# zsh functions for ghq/peco
setopt hist_ignore_all_dups

function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

