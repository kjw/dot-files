#!/bin/bash

dir=~/dot-files
links="gitconfig tmux.conf bash_profile xmobarrc Xmodmap xinitrc"

for link in $links; do
  rm -rf ~/.$link
  ln -s $dir/$link ~/.$link
done

mkdir ~/.xmonad
ln -s $dir/xmonad.hs ~/.xmonad/xmonad.hs

mkdir ~/.lein
ln -s $dir/profiles.clj ~/.lein/profiles.clj
