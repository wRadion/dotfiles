if [ -e $DISPLAY ]; then
  if [ -x "$(command -v startx)" ]; then
    startx
  fi
fi
