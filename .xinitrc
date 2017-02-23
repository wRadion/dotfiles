[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
xbindkeys
setxkbmap -option caps:escape
exec i3
