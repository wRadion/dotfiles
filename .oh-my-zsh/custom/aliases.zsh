#! /bin/sh

#########
# UTILS #
#########
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -lh"
alias l="ls -lha"

alias tree="tree -C"
alias ..="cd .."
alias ...="cd ../.."
alias e="vim"

alias wcln="rm -rvf *~; rm -rvf .*~; rm -rvf \#*; rm -rvf .\#*"
alias reload="source ~/.zshrc"
alias reload!="reload; echo 'Reload OK!'"

alias ssha='eval $(ssh-agent); ssh-add'

#######
# GIT #
#######
alias g="git"
alias gs="git status"
alias gt="git stash"
alias gtp="git stash pop"
alias gd="git diff"
alias ga="git add -A"
alias gc="git commit -m"
alias gl="git log"

alias gco="git checkout"
alias gp="git pull"
alias gpp="git push"
alias gcp="git cherry-pick"
alias gb="git branch"

alias amend="git commit --amend"

##########
# GITHUB #
##########
alias pr="hub pull-request"

########
# RUBY #
########
alias gemfile="echo \"source 'https://rubygems.org/'\n\n\" > Gemfile; e Gemfile +3"
alias rspec="rspec -cf d"
alias rpsec="rspec"
alias b="bundle"
alias be="bundle exec"
