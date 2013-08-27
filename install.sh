#!/bin/bash

dir=~/dot-files
links="emacs emacs-themes gitconfig tmux.conf bash_profile xmobarrc Xmodmap xinitrc"

for link in $links; do
  rm -rf ~/.$link
  ln -s $dir/$link ~/.$link
done

mkdir ~/.xmonad
cp xmonad.hs ~/.xmonad/xmonad.hs

