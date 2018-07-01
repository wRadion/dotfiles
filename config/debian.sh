#! /bin/bash

# Packages to install
PACKAGES="
sudo zip git curl build-essential module-assistant
dirmngr gnupg2 fonts-powerline fonts-noto
zsh xorg i3 alsa-utils
xterm vim chromium htop tree
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
install "fzf-git" "command -v fzf"
install "rvm" "command -v rvm"

SYMBOLIC_LINKS="
  .oh-my-zsh/themes/wradion.zsh-theme
  .oh-my-zsh/custom/aliases.zsh
  .oh-my-zsh/custom/exports.zsh
  .vim/colors/wradion.vim
  .config/htop/htoprc
  .config/i3/config
  .config/i3status/config
  .zshrc
  .fzf.zsh
  .vimrc
  .gitconfig
  .xinitrc
  .Xresources
  .zprofile
"

puts
puts "${B_YELLOW}SYMBOLIC LINKS${RESET}"
puts "${B_YELLOW}--------------${RESET}"

for F in $SYMBOLIC_LINKS; do
  create_link $F
done
