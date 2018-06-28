[[ -f ~/.Xresources ]] && xrdb ~/.Xresources
setxkbmap -option caps:escape
xset r rate 200 50
exec i3
