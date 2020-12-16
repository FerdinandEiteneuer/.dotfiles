#!/bin/bash
#script for gathering configs and putting them in this repository

REPO_DIR=~/.dotfiles

cd $REPO_DIR/.config

# copy dotfiles
cp -r ~/.config/i3 .
cp ~/.gitconfig .
cp ~/.vimrc .
cp -r ~/.config/fish .


# delete my hardcoded email adresses which might be present in the dotfiles
cd $REPO_DIR
./remove_sensitive_info.sh
