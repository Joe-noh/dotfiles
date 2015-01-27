#!/bin/sh

HERE=$(pwd)

ln -s "$HERE/.zshrc" ~/

ln -s "$HERE/.tmux.conf" ~/

ln -s "$HERE/.gitignore" ~/
ln -s "$HERE/.gitconfig" ~/

ln -s "$HERE/.vimrc" ~/

if [ ! -f ~/.emacs.d ]; then
  mkdir ~/.emacs.d
fi

ln -s "$HERE/.emacs.d/init.el"         ~/.emacs.d/
ln -s "$HERE/.emacs.d/first_of_all.el" ~/.emacs.d/

