#! /bin/bash

#--------------#
# Load scripts #
#--------------#

source "./src/colors.sh"
source "./src/functions.sh"

#----------------#
# Initialization #
#----------------#

source "./src/init.sh"

#------------------#
# OS Configuration #
#------------------#

# TODO: Currently the config file is going to install every packages
#       This should not be the case
source "$OS_CONFIG"

exit 0
