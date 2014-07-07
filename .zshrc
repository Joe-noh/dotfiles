# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wezm+"

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump encode64 ruby rails bundle gem rbenv)

source $ZSH/oh-my-zsh.sh

setopt no_beep
setopt no_correct

unsetopt share_history

alias emacs="emacs -nw"
alias be="bundle exec"

export TERM=xterm-256color
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
