#!/bin/bash
#prepare vundle and make backup for .vimrc
#mkdir -p ~/.vim/bundle
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#mv ~/.vimrc ~/vimrc.backup.$(date "+%F-%s")
ln -sf $(pwd)/vimrc ~/.vimrc
ln -sf $(pwd)/vimrc.bundles ~/.vimrc.bundles
ln -sf $(pwd)/vimrc.bundles.local ~/.vimrc.bundles.local 
