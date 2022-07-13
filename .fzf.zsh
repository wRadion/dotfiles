# Setup fzf
# ---------
if [[ ! "$PATH" == */home/wradion/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/wradion/.fzf/bin"
fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/home/wradion/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/wradion/.fzf/shell/key-bindings.zsh"
