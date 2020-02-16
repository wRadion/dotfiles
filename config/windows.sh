#! /bin/sh

echo "Follow these instructions:"
echo "    1. Go to Settings > Update & Security > For developers"
echo "        Enable 'Developer mode'"
echo "    2. Start optionalfeatures.exe"
echo "        Check Windows Subsystem for Linux"
echo "    3. Reboot your PC"
echo "    4. Go to Windows Store"
echo "        Install a linux distribution (debian or ubuntu recommanded)"
printf "Type (y) if everything is done (y/n): "

read answer

if [ "$answer" != "y" ]; then
    exit 0
fi

echo "You can now launch debian/ubuntu and use the debian installer!"

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim