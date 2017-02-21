#! /bin/sh

export DOTFILES="$HOME/.dotfiles"

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
  [ -e $HOME/.config/htop/htoprc ] && rm -f $HOME/.config/htop/htoprc
  ln -s $DOTFILES/config/htop/htoprc $HOME/.config/htop

  [ -e $HOME/.oh-my-zsh/themes/wradion.zsh-theme ] && rm -f $HOME/.oh-my-zsh/themes/wradion.zsh-theme
  ln -s $DOTFILES/zsh/oh-my-zsh/themes/wradion.zsh-theme $HOME/.oh-my-zsh/themes/wradion.zsh-theme

  [ -e $HOME/.zshrc ] && rm -f $HOME/.zshrc
  ln -s $DOTFILES/zsh/zshrc $HOME/.zshrc

  [ -e $HOME/.vimrc ] && rm -f $HOME/.vimrc
  ln -s $DOTFILES/vim/vimrc $HOME/.vimrc

  [ -e $HOME/.vim/colors/wradion.vim ] && rm -f $HOME/.vim/colors/wradion.vim
  ln -s $DOTFILES/vim/colors/wradion.vim $HOME/.vim/colors/wradion.vim

  [ -e $HOME/.irbrc ] && rm -f $HOME/.irbrc
  ln -s $DOTFILES/other/irbrc $HOME/.irbrc

  [ -e $HOME/.pryrc ] && rm -f $HOME/.pryrc
  ln -s $DOTFILES/other/pryrc $HOME/.pryrc

  [ -e $HOME/.gitconfig ] && rm -f $HOME/.gitconfig
  ln -s $DOTFILES/git/gitconfig $HOME/.gitconfig
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
