#!/bin/zsh

###########
#  Setup  #
###########
# Update dotfiles with yadm
alias yu="yadm pull && yadm bootstrap"

#########
#  Git  #
#########
alias gcm="git checkout main"
alias gcd="git checkout develop"

case `uname` in
  Darwin)
    source $XDG_CONFIG_HOME/homebrew/homebrew.zsh
  ;;
esac
