#!/bin/bash

###########################################################
##Script Name  : Startup Script
##Description  : Script to pull linux setup and run it.
##Args         :
##Author       :Jeremiah Jordan
##Email        :jeremiah@thecomputerworksnm.com
###########################################################

logfile=~/install.log
setupdir=~/system_setup

log() {
  msg=">>> $1"
  echo -e "\n$msg"
  printf "\n[%s] %s\n" "$(date '+f %H:%M:%S')" "$1" >> $logfile
}

require_sudo() {
  if [[ "$EUID" -ne 0 ]]; then
    sudo -v
  fi
}

log "Setting up Bootstrap program..."

require_sudo

sudo apt install -y ssh gh

gh auth login

mkdir -p $setupdir

git clone git@github.com:j2-82/bootstrap.git $setupdir


