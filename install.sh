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

SYMBOLIC_LINKS="
  .oh-my-zsh/themes/wradion.zsh-theme
  .oh-my-zsh/custom/aliases.zsh
  .oh-my-zsh/custom/exports.zsh
  .vim/colors/wradion.vim
  .config/htop/htoprc
  .config/i3/config
  .config/i3status/config
  .fzf/shell/key-bindings.zsh
  .zshrc
  .fzf.zsh
  .vimrc
  .gitconfig
  .xinitrc
  .Xresources
  .zprofile
  .fonts.conf
"

puts
puts "${B_YELLOW}SYMBOLIC LINKS${RESET}"
puts "${B_YELLOW}--------------${RESET}"

for F in $SYMBOLIC_LINKS; do
  create_link $F
done

#-----#
# END #
#-----#

exit 0
