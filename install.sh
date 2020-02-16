#! /bin/bash

#--------------#
# Load scripts #
#--------------#

source "./src/colors.sh"
source "./src/functions.sh"

#----------------#
# Initialization #
#----------------#

source "./src/init.sh"

#------------------#
# OS Configuration #
#------------------#

if [ "$2" != 'link-only' ]; then
  source "$OS_CONFIG"
fi

#----------------#
# Symbolic Links #
#----------------#

SYMBOLIC_LINKS_COMMON="
  .vim/colors/wradion.vim
  .vimrc
  .gitconfig
"

SYMBOLIC_LINKS_UNIX="
  .oh-my-zsh/themes/wradion.zsh-theme
  .oh-my-zsh/custom/aliases.zsh
  .oh-my-zsh/custom/exports.zsh
  .zshrc
  .config/htop/htoprc
  .config/i3/config
  .config/i3status/config
  .fzf.zsh
  .fzf/shell/key-bindings.zsh
  .xinitrc
  .Xresources
  .zprofile
  .fonts.conf
"

puts
puts "${B_YELLOW}SYMBOLIC LINKS${RESET}"
puts "${B_YELLOW}--------------${RESET}"

for F in $SYMBOLIC_LINKS_COMMON; do
  create_link $F
done

if [ "$OS" == "windows" ]; then
  echo "Done for Windows."
  exit 0
fi

for F in $SYMBOLIC_LINKS_UNIX; do
  create_link $F
done

#-----#
# END #
#-----#

exit 0
