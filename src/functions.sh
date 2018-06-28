#! /bin/sh

# Printf with newline
puts () {
  printf "$1\n"
}

# Install something using a script file (inside ./src/custom/)
install () {
  printf "${B_CYAN}Checking ${B_WHITE}$1${B_CYAN}...${RESET} "
  $2 >/dev/null

  if [ $? = 0 ]; then
    puts "${B_GREEN}ok${RESET}"
  else
    puts "${B_RED}ko${RESET}"
    puts "${B_CYAN}└${B_YELLOW}Installing ${B_WHITE}$1${B_YELLOW}...${RESET}"

    # Make sure to go to HOME before doing anything
    cd $HOME

    source $DOTFILES/src/custom/$1.sh
    RESULT=$?

    # Make sure to return to this folder after install
    cd $DOTFILES
  fi
}

create_link () {
  printf "${B_CYAN}Symlink ${B_WHITE}$1${B_CYAN}...${RESET} "

  mkdir -p $HOME/$(dirname $1)

  ln -sf $DOTFILES/$1 $HOME/$1

  if [ $? = 0 ]; then
    puts "${B_GREEN}linked${RESET}"
    return 0
  else
    puts "${B_RED}link failed${RESET}"
    return 1
  fi
}
