#! /usr/bin/env ruby

require 'pry'

def check_binary(name)
  print "checking for #{name}... "
  found = system("command -v #{name} >/dev/null")
  puts "#{found ? 'OK' : 'KO'}"
  found
end

###############################################################################
# START                                                                       #
###############################################################################

puts 'installing .dotfiles'
DOTFILES_DIR = File.dirname(File.expand_path(__FILE__))
puts "dotfiles directory is #{DOTFILES_DIR}"

#---------------------#
# Check dependencies  #
#---------------------#

DEPENDENCIES = %w{
  git
  wget
  tar
}.freeze

if DEPENDENCIES.any? { |bin| !check_binary(bin) }
  puts "please check binaries above before executing this script"
  exit(1)
end

#----------------#
# Installing zsh #
#----------------#


exit(0)
