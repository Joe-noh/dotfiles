#!/bin/sh

ln -s ./.zshrc ~/

ln -s ./.tmux.conf ~/

ln -s ./.gitignore ~/
ln -s ./.gitconfig ~/

ln -s ./.vimrc ~/

if [ ! -f ~/.emacs.d ]; then
  mkdir ~/.emacs.d
fi

ln -s ./.emacs.d/init.el         ~/.emacs.d/
ln -s ./.emacs.d/first_of_all.el ~/.emacs.d/

