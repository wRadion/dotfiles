#! /bin/sh

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Extended paths
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:/usr/local/bin"

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
#
# PostgreSQL
export PGDATA="/usr/local/var/postgres/data/"
