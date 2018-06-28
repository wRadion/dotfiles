#! /bin/sh

CHECK="pacman -Q"
INSTALL="pacman -S --noconfirm"

install "yaourt" "command -v yaourt"
install "font" "pacman -Q ttf-dejavu-sans-mono-powerline-git"
install "oh-my-zsh" "test -d $HOME/.oh-my-zsh"
install "zsh-syntax-highlighting" "test -d $HOME/.zsh/zsh-syntax-highlighting"
install "vundle" "test -d $HOME/.vim/bundle/Vundle.vim"
install "fzf" "test -f /usr/local/opt/fzf/shell/key-bindings.zsh"
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
