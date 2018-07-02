#! /bin/bash

# Packages to install
PACKAGES="
zip curl build-essential module-assistant
dirmngr gnupg2 fonts-powerline fonts-noto
zsh xorg i3 alsa-utils policykit-1
xterm vim chromium htop tree silversearcher-ag
"

puts
puts "${B_YELLOW}PACKAGES${RESET}"
puts "${B_YELLOW}--------${RESET}"

sudo apt-get install $PACKAGES

puts
puts "${B_YELLOW}PROGRAMS${RESET}"
puts "${B_YELLOW}--------${RESET}"

install "oh-my-zsh" "test -d $HOME/.oh-my-zsh"
install "zsh-syntax-highlighting" "test -d $HOME/.zsh/zsh-syntax-highlighting"
install "vundle" "test -d $HOME/.vim/bundle/Vundle.vim"
install "fzf" "command -v fzf"
install "rvm" "command -v rvm"

