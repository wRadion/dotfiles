local return_code="%(?,%F{22}%K{green},%F{52}%K{160}) %?%(?,%F{green},%F{160})"

PROMPT='${return_code} %K{148}%F{22} %B%c%b%K{148} %K{236}%F{148}%F{248} $(git_prompt_info)%k%F{236}%f '
RPROMPT='%F{234}%K{234}%F{244} %T %F{236}%K{236}%F{248} %D{%a. %d %b %Y} %F{148}%K{148}%F{22}  %B%h%b%K{148} %f%k'

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{1}✖"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{2}✔"
