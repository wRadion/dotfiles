#! /bin/sh

# Check for yaourt installation
pacman -Q yaourt
if [ $? = 0 ]; then
  sudo yaourt -S ttf-dejavu-sans-mono-powerline-git
else
  echo "You must install yaourt before installing the font"
fi
