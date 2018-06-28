#! /bin/sh

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Create the directory for vim swap files (nothing to do with Vundle)
mkdir .vim/swapfiles

echo "We recommand use do 'vim -c PluginInstall' after!"
