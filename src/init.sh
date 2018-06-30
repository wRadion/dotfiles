#! /bin/bash

# Check if the script is running as root (sudo)
if [ "$EUID" -eq 0 ]; then
  puts "${B_RED}ERROR: You can't be root to execute this script.${RESET}"
  puts "${B_RED}But you MAY have to enter the root password for some installations.${RESET}"
  exit 1
fi

# Get into this dir no matter where you call this script
cd `dirname $0`
DOTFILES=`pwd`

# Check if the first arg is present and supported
if [ "$1" == "" ]; then
  puts "${B_RED}Usage: $0 [archlinux|debian]${RESET}"
  exit 1
fi

OS_CONFIG="$DOTFILES/config/$1.sh"
if [ -f "$OS_CONFIG" ]; then
  puts "${B_CYAN}Installation for $1${RESET}"
else
  puts "${B_RED}ERROR: OS type '$1' is not supported.${RESET}"
  exit 1
fi

# Because the script is run as root, we need to get the real user HOME
HOME=`eval echo ~$SUDO_USER`
