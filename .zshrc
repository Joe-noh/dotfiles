# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="wezm+"

# Which plugins would you like to load?
# (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git autojump encode64)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

unsetopt share_history

alias emacs="emacs -nw"

export TERM=xterm-256color

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
