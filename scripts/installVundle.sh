#!/bin/bash

# test if vundle is already installed
if [ ! -d ~/.vim/bundle/Vundle.vim/ ] ; then
	git clone http://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else 
	echo "Vundle is already installed!"
fi
