#! /bin/sh

# Packages to install
PACKAGES="
wget curl tar zip zsh vim tree htop openssl the_silver_searcher
xterm xorg-server xorg-xinit i3-wm i3status dmenu
chromium alsa-utils yajl polkit
"

puts
puts "${B_YELLOW}PACKAGES${RESET}"
puts "${B_YELLOW}--------${RESET}"

sudo pacman -S $PACKAGES

puts
puts "${B_YELLOW}PROGRAMS${RESET}"
puts "${B_YELLOW}--------${RESET}"

install "yaourt" "command -v yaourt"
install "font" "pacman -Q ttf-dejavu-sans-mono-powerline-git"
install "oh-my-zsh" "test -d $HOME/.oh-my-zsh"
install "zsh-syntax-highlighting" "test -d $HOME/.zsh/zsh-syntax-highlighting"
install "vundle" "test -d $HOME/.vim/bundle/Vundle.vim"
install "fzf" "command -v fzf"
install "rvm" "command -v rvm"