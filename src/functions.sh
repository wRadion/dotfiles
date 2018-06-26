#! /bin/sh

# Printf with newline
puts () {
  printf "$1\n"
}

# Generic check
check () {
  $1 >/dev/null 1>/dev/null 2>/dev/null

  if [ $? = 0 ]; then
    true
  else
    false
  fi
}

# Check for a package to be installed
check_package () {
  check "$CHECK $1"
}

# Check for a binary to exist
check_binary () {
  check "command -v $1"
}

# Check for a file to exist
check_file () {
  if [ "$1" == "" ]; then
    check "test -f ''"
  else
    check "test -f $1"
  fi
}

# Check for a directory to exist
check_dir () {
  if [ "$1" == "" ]; then
    check "test -d ''"
  else
    check "test -d $1"
  fi
}

# Install a package if it's not already installed
# The check can be configured using the second argument
install () {
  if [ "$2" == "" ]; then
    CHECK_CMD="check_package $1"
  else
    CHECK_CMD="$2"
  fi

  printf "${B_CYAN}Checking ${B_WHITE}$1${B_CYAN}...${RESET} "
  $CHECK_CMD

  if [ $? = 0 ]; then
    puts "${B_GREEN}ok${RESET}"
  else
    puts "${B_RED}ko${RESET}"

    printf "${B_CYAN}└${B_YELLOW}Installing ${B_WHITE}$1${B_YELLOW}...${RESET} "
    $INSTALL $1 >/dev/null 1>/dev/null 2>/dev/null

    if [ $? = 0 ]; then
      puts "${B_GREEN}ok${RESET}"
      return 0
    else
      puts "${B_RED}ko${RESET}"
      return 1
    fi
  fi
}

install_custom () {
  printf "${B_CYAN}Checking ${B_WHITE}$1${B_CYAN}...${RESET} "
  $2

  if [ $? = 0 ]; then
    puts "${B_GREEN}ok${RESET}"
  else
    puts "${B_RED}ko${RESET}"

    printf "${B_CYAN}└${B_YELLOW}Installing ${B_WHITE}$1${B_YELLOW}...${RESET} "

    # Make sure to go to HOME before doing anything
    cd $HOME

    source ./src/custom/$1.sh >/dev/null 1>/dev/null 2>/dev/null
    RESULT=$?

    # Make sure to return to this folder after install
    cd $DOTFILES

    if [ $RESULT = 0 ]; then
      puts "${B_GREEN}ok${RESET}"
      return 0
    else
      puts "${B_RED}ko${RESET}"
      return 1
    fi
  fi
}

create_link () {
  printf "${B_CYAN}Creating symbolic link for ${B_WHITE}$1${B_CYAN}...${RESET} "

  mkdir -p $HOME/$(dirname $1)

  ln -sf $DOTFILES/$1 $HOME/$1

  if [ $? = 0 ]; then
    puts "${B_GREEN}ok${RESET}"
    return 0
  else
    puts "${B_RED}ko${RESET}"
    return 1
  fi
}
