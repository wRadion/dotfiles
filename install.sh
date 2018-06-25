#! /bin/sh

# Get into this dir no matter where you call this script
cd `dirname $0`
DOTFILES=`pwd`

#-------------------#
# Determine OS type #
#-------------------#

case "$OSTYPE" in
  linux*)  LINUX="true" ; MAC="false"   ;;
  darwin*) MAC="true"   ; LINUX="false" ;;
esac

necho () {
  if $LINUX; then
    echo -n "$1"
  elif $MAC; then
    echo "$1\c"
  fi
}

# Usage:
#  if $LINUX; then echo "Hello, linux!"; fi
#  if $MAC;   then echo "Hello, Mac!"  ; fi

#-----------#
# Functions #
#-----------#

check_binary () {
  if [ "$2" != "noecho" ]; then
    necho "checking for $1... "
  fi
  if [ "$CHECK_COMMAND" = "" ]; then
    CHECK_COMMAND="command -v $1"
  fi
  FOUND="$CHECK_COMMAND"
  CHECK_COMMAND=""
  if $FOUND >/dev/null; then
    if [ "$2" != "noecho" ]; then
      echo "OK"
    fi
    return 0
  else
    if [ "$2" != "noecho" ]; then
      echo "NOT INSTALLED"
    fi
    if [ "$2" = "required" ]; then
      echo "ERROR: The program '$1' needs to be installed. Please install it and execute this script again."
      exit 1
    fi
    return 1
  fi
}

FOUND=""
INSTALLED=""
FAILED=""

install () {
  TMP_CHECK_COMMAND="$CHECK_COMMAND"
  check_binary "$1"
  CHECK_COMMAND="$TMP_CHECK_COMMAND"
  if [ $? = 0 ]; then
    FOUND+=" $1"
    return 0
  fi
  echo "installing $1..."
  if [ "$3" != "" ]; then
    COMMAND="$3"
  else
    COMMAND="$INSTALL $1"
  fi
  echo "running: $COMMAND"
  $COMMAND
  check_binary "$1" "noecho"
  if [ $? = 0 ]; then
    echo "installed $1 successfully"
    INSTALLED+=" $1"
    return 0
  else
    if [ "$2" = "required" ]; then
      echo "The program '$1' was not installed successfully. Please check your system or try to run:"
      echo ""
      echo "      $COMMAND"
      echo ""
      exit 1
    else
      echo "$1 was not installed successfully"
      FAILED+=" $1"
      return 1
    fi
  fi
}

create_link () {
  necho "creating symbolic link for $1... "
  mkdir -p $HOME/$(dirname $1)
  ln -sf $DOTFILES/$1 $HOME/$1
  if [ $? = 0 ]; then
    echo "OK"
  else
    FAILED+=" symlink_for_$1"
    echo "ERROR"
  fi
}

#---------------------------#
# Determine package manager #
#---------------------------#

INSTALL=""
if $MAC; then
  check_binary "brew" "required"
  INSTALL="brew install"
elif $LINUX; then
  check_binary "yum"
  if [ $? = 0 ]; then
    INSTALL="yum install"
  fi
  check_binary "pacman"
  if [ $? = 0 ]; then
    INSTALL="pacman -S"
  fi
  check_binary "yaourt"
  if [ $? = 0 ]; then
    INSTALL="yaourt -S"
  fi
  check_binary "apt-get"
  if [ $? = 0 ]; then
    INSTALL="apt-get install"
  fi
fi

if [ "$INSTALL" == "" ]; then
  echo "ERROR: No package manager found. Aborting."
  exit 1
fi

#--------------------------------#
# Check and install dependencies #
#--------------------------------#

install "git"  "required"
install "wget" "required"
install "tar"  "required"

#------------------#
# Install programs #
#------------------#

# ZSH #
install "zsh"                     "required"
# OH-MY-ZSH #
CHECK_COMMAND="test -d $HOME/.oh-my-zsh"
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > omz.sh
TMP="source omz.sh"
install "oh-my-zsh"               "required" "$TMP"
rm omz.sh

# ZSH-SYNTAX-HIGHLIGHTING #
CHECK_COMMAND="test -d $HOME/.zsh/zsh-syntax-highlighting/"
TMP="git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting"
install "zsh-syntax-highlighting" "" "$TMP"

if [ $? = 0 ]; then
  create_link ".zshrc"
  create_link ".oh-my-zsh/themes/wradion.zsh-theme"
  create_link ".oh-my-zsh/custom/aliases.zsh"
  create_link ".oh-my-zsh/custom/exports.zsh"
fi

install "fzf"
if [ $? = 0 ]; then
  create_link ".fzf.zsh"
fi

# EDITOR #
install "vim"
if [ $? = 0 ]; then
  mkdir -p $HOME/.vim/swapfiles

  necho "checking for Vundle... "
  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    echo "NOT INSTALLED"
    echo "installing Vundle for vim..."
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
  else
    echo "OK"
  fi

  create_link ".vimrc"
  create_link ".vim/colors/wradion.vim"
  create_link ".vim/snippets/ruby.snippets"
fi

# TOOLS #
install "tree"
install "htop"
if [ $? = 0 ]; then
  create_link ".config/htop/htoprc"
fi
install "curl"
install "valgrind"
if [ $? = 0 ]; then
  create_link ".valgrindrc"
fi

create_link ".irbrc"
create_link ".pryrc"
create_link ".gitconfig"

# SECURITY #
install "gpg-agent"
install "openssl"

# LINUX SPECIFIC #
if $LINUX; then
  CHECK_COMMAND="check_binary Xorg"
  install "xorg"
  if [ $? = 0 ]; then
    create_link ".xinitrc"
    create_link ".Xresources"
  fi

  install "i3"
  if [ $? = 0 ]; then
    create_link ".config/i3/config"
    create_link ".zprofile"

    install "dmenu"
  fi

  # FZF
  sudo mkdir -p /usr/local/opt/fzf/shell
  ln -s $DOTFILES/.key-bindings.zsh /usr/local/opt/fzf/shell/key-bindings.zsh

  # Sound
  install "alsa-utils"

  # TODO: install fonts (DejaVu Sans Mono for powerline), ...
fi

# MACOS SPECIFIC #
if $MAC; then
  install "cask"
  if [ $? = 0 ]; then
    INSTALL="brew cask install"
    install "karabiner"
    CHECK_COMMAND="brew cask info seil"
    install "seil"
    INSTALL="brew install"
  fi
fi

echo

if [ "$INSTALLED" != "" ]; then
  echo "INSTALLED programs:"
  for NAME in $INSTALLED; do
    echo "  $NAME"
  done
fi

if [ "$FAILED" != "" ]; then
  echo "NOT INSTALLED programs:"
  for NAME in $FAILED; do
    echo "  $NAME"
  done
fi

echo
echo "done"

exit 0
