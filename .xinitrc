[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
xbindkeys
setxkbmap -option caps:escape
xset r rate 200 50
exec i3
