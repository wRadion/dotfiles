#! /bin/sh

#############
# JOBTEASER #
#############
[ -f $HOME/.jtrc ] && source $HOME/.jtrc

JOBTEASER_DIR='/Volumes/JobTeaser'

# ALIASES

alias gpd="git checkout develop; git pull; git checkout -"

alias c="ruby scripts/console"

alias bastion="ssh -p 6677 -A root@bastion.jobteaser.net"

alias j="cd $JOBTEASER_DIR"
alias jc="cd $JOBTEASER_DIR/jobcrawler"
alias jt="cd $JOBTEASER_DIR/jobteaser"

alias update_subsets="ruby ~/.scripts/update_subsets.rb"

# EXPORTS

export YANDEX_API_KEY='trnsl.1.1.20160809T102430Z.07c0e6a779b529b2.fbbb356e40b658111961ca2fbff693c72648503d'
export SMART_TOKEN="90a7ef29c9219f3e0c645e34605e4ecfeed1960909676ebd68ccf43b5ba00663"
