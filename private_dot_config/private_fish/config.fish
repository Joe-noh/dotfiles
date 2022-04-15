set GOPATH $HOME/Workspace
set PATH $GOPATH/bin $PATH
set PATH /opt/homebrew/bin $PATH
set PATH $HOME/.anyenv/bin $PATH
set PATH /usr/local/opt/python@3.9/libexec/bin $PATH
set ERL_AFLAGS "-kernel shell_history enabled"
set KERL_BUILD_DOCS "yes"

alias k=kubectl
alias gfm='git pull'
alias iem='iex -S mix'
alias dc='docker-compose'
alias be='bundle exec'

starship init fish | source
source /usr/local/opt/asdf/asdf.fish
