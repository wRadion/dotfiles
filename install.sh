#! /bin/sh

echo "Installing dotfiles..."

# INSTALL CONFIG
echo "Install config files (y/n)? "
read input
if [ "$input" = "y" ]; then
  echo "Creating required directories in $HOME..."
  mkdir -vp $HOME/.config/htop
  mkdir -vp $HOME/.oh-my-zsh/themes
  mkdir -vp $HOME/.vim/colors
  mkdir -vp $HOME/.vim/swapfiles

  echo "Creating symbolic links..."
  echo "  $HOME/.config/htop/htoprc"
  [ -f $HOME/.config/htop/htoprc ] && rm $HOME/.config/htop/htoprc
  ln -s ./config/htop/htoprc $HOME/.config/htop

  echo "  $HOME/.oh-my-zsh/themes/wradion.zsh-theme"
  [ -f $HOME/.oh-my-zsh/themes/wradion.zsh-theme ] && rm $HOME/.oh-my-zsh/themes/wradion.zsh-theme
  ln -s ./oh-my-zsh/themes/wradion.zsh-theme

  echo "  $HOME/.zshrc"
  [ -f $HOME/.zshrc ] && rm $HOME/.zshrc
  ln -s ./zsh/zshrc $HOME/.zshrc

  echo "  $HOME/.vimrc"
  [ -f $HOME/.vimrc ] && rm $HOME/.vimrc
  ln -s ./vim/vimrc $HOME/.vimrc

  echo "  $HOME/.vim/colors/wradion.vim"
  [ -f $HOME/.vim/colors/wradion.vim ] && rm $HOME/.vim/colors/wradion.vim
  ln -s ./vim/colors/wradion.vim $HOME/.vim/colors/wradion.vim

  echo "  $HOME/.irbrc"
  [ -f $HOME/.irbrc ] && rm $HOME/.irbrc
  ln -s ./other/irbrc $HOME/.irbrc

  echo "  $HOME/.pryrc"
  [ -f $HOME/.pryrc ] && rm $HOME/.pryrc
  ln -s ./other/pryrc $HOME/.pryrc

  echo "  $HOME/.gitconfig"
  [ -f $HOME/.gitconfig ] && rm $HOME/.gitconfig
  ln -s ./git/gitconfig $HOME/.gitconfig
fi

# INSTALL LINUXBREW
echo "Install Linuxbrew (y/n)? "
read input
if [ "$input" = "y" ]; then
  echo "Install Linuxbrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
fi

# INSTALL BREWS
echo "Install brews (y/n)? "
read input
if [ "$input" = "y" ]; then
  if [ -f ./brewfile.sh ]; then
    echo "Installing brews..."
    source ./brewfile.sh
  fi
fi

# INSTALL RVM
echo "Install RVM (y/n)? "
read input
if [ "$input" = "y" ]; then
  echo "Installing RVM..."
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  \curl -sSL https://get.rvm.io | bash -s stable
fi

# CHANGE SHELL
chsh -s /bin/zsh

echo "Done."
