#! /bin/sh

CHECK="pacman -Q"
INSTALL="pacman -S --noconfirm"

REQUIRED_PACKAGES="
  wget
  curl
  tar
"

puts
puts "${B_YELLOW}REQUIRED PACKAGES${RESET}"
puts "${B_YELLOW}-----------------${RESET}"

for P in $REQUIRED_PACKAGES; do
  install $P

  if [ $? != 0 ]; then
    puts "${B_RED}ERROR: Could not install required package ${B_WHITE}$P${B_RED}.${RESET}"
    puts "${B_RED}Aborting${RESET}"
    exit 1
  fi
done

PACKAGES="
  zsh
  fzf
  vim
  tree
  htop
  valgrind
  openssl
  the_silver_searcher
  xorg-server
  i3-wm
  i3status
  i3blocks
  dmenu
  alsa-utils
  ttf-dejavu-sans-mono-powerline-git
  yajl
"

puts
puts "${B_YELLOW}PACKAGES${RESET}"
puts "${B_YELLOW}--------${RESET}"

for P in $PACKAGES; do
  install $P
done

puts
puts "${B_YELLOW}CUSTOM INSTALLS${RESET}"
puts "${B_YELLOW}---------------${RESET}"

install_custom "yaourt" "check_binary yaourt"
install_custom "oh-my-zsh" "check_dir $HOME/.oh-my-zsh"
install_custom "zsh-syntax-highlighting" "check_dir $HOME/.zsh/zsh-syntax-highlighting"
install_custom "vundle" "check_dir $HOME/.vim/bundle/Vundle.vim"
install_custom "fzf" "check_file /usr/local/opt/fzf/shell/key-bindings.zsh"

SYMBOLIC_LINKS="
  .oh-my-zsh/themes/wradion.zsh-theme
  .oh-my-zsh/custom/aliases.zsh
  .oh-my-zsh/custom/exports.zsh
  .vim/colors/wradion.vim
  .vim/snippets/ruby.snippets
  .config/htop/htoprc
  .config/i3/config
  .config/i3status/config
  .zshrc
  .fzf.zsh
  .vimrc
  .valgrindrc
  .irbrc
  .pryrc
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
