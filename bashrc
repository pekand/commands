#!/bin/bash

#if [ -f $HOME/commands/bashrc ]; then
#    . $HOME/commands/bashrc
#fi

#PS1="\[\033[01;32m\]\$PWD\[\033[00m\]: \e[1;33m"
#trap 'printf "\e[0m" "$_"' DEBUG

PS1="\[\e[1;32m\]\$PWD:\[\e[m\]\[\e[1;33m\]"
trap 'printf "\e[0m" "$_"' DEBUG

alias HOME="cd ~"
alias DESKTOP="cd ~/Desktop"
alias DOWNLOADS="cd ~/Downloads"
alias COMMANDS="cd ~/commands"
alias BCKG="cd ~/Bckg/"
alias MAIL="cd /var/log/mail"
alias ETC="cd /etc"

alias WWW="cd /var/www/"
alias HTTP="cd /var/www/http/"

alias SRC="cd /var/www/src/"

function c() {
    new_directory="$*";
    new_directory_len=${#new_directory}
    new_directory_cnt="${new_directory//[^\.]}"
    new_directory_cnt=${#new_directory_cnt}

    if [ $# -eq 0 ]; then
        new_directory="";
    fi;

    if [ $new_directory_len == 0 ]; then
      ls -lah
    else
      if [ $new_directory_len == $new_directory_cnt ]; then
        for (( c=1; c<=$new_directory_cnt; c++ ))
        do
           cd ..
        done
        ls
      else
        builtin cd "${new_directory}" && ls
      fi
    fi;
}

function UP() {
    REPO_HOME=$(git rev-parse --show-toplevel)
    builtin cd "${REPO_HOME}"
}

directory=/home/kerberos/history/
if [ ! -d $directory ]; then
  mkdir $directory
fi
directory=${directory}$(date +'%Y')/
if [[ ! -d $directory ]]; then
  mkdir $directory
fi
directory=${directory}$(date +'%m')/
if [[ ! -d $directory ]]; then
  mkdir $directory
fi
directory=${directory}$(date +'%d')
if [[ ! -d $directory ]]; then
  mkdir $directory
fi

export HISTFILE=$directory/history-`date +"%Y-%m-%d-%H-%M-%S"`.txt
touch $HISTFILE

export EDITOR=vim
export VISUAL=subl

export CLASSPATH=${CLASSPATH}:/usr/local/lib/apache-log4j-2.2/log4j-api-2.2.jar
export PATH=${PATH}:/usr/local/lib/apache-log4j-2.2/
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=${PATH}:${JAVA_HOME}/bin
PATH=${PATH}:${HOME}/commands/

. DO --load