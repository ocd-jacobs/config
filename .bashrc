# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# Set terminal emulator
export TERM=xterm-256color

# Set custom prompt
#export PS1="\e[0;36m\w\$ \e[m"

# Set readline VI mode
set -o vi

# neovim alias
#alias nvim=/home/john/bin/nvim.appimage

# Set history options
HISTCONTROL=ignoreboth
HISTIGNORE=":ls*:history*:cd*:fcd*:fdo*:clear:man*:mc:exit:mdo*"
shopt -s histappend

# fuzzy search functions
function fcd() {
  cd $(find $1 -type d | fzy)
}

function fdo() {
  PROG=$1

  if [ $PROG == 'nvim' ]
  then
    PROG="nvim.appimage"
  fi
  
  $PROG $(find $2 -type f | fzy)
}

function mdo() {
  PROG=$1

  if [ $PROG == 'nvim' ]
  then
    PROG="nvim.appimage"
  fi
  
  $PROG $(locate $2 | fzy)
}

# Set color mode for ls
alias ls=ls\ --color

