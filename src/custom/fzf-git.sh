#! /bin/bash

git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
cd ~/.fzf
./install

ln -sf $DOTFILES/.key-bindings.zsh ~/.fzf/shell/key-bindings.zsh
