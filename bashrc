#!/bin/bash

#if [ -f $HOME/Everlution/script/bashrc ]; then
#    . $HOME/Everlution/script/bashrc
#fi

#PS1="\[\033[01;32m\]\$PWD\[\033[00m\]: \e[1;33m"
#trap 'printf "\e[0m" "$_"' DEBUG

PS1="\[\e[1;32m\]\$PWD:\[\e[m\]\[\e[1;33m\]"
trap 'printf "\e[0m" "$_"' DEBUG

alias HOME="cd ~"
alias DESKTOP="cd ~/Desktop"
alias DOWNLOADS="cd ~/Downloads"
alias EVERLUTION="cd ~/Desktop/Everlution"
alias EVER="cd ~/Desktop/Everlution"
alias DIAGRAMS="cd ~/Desktop/Everlution/Diagrams"
alias SCRIPTS="cd ~/Desktop/Everlution/script"
alias BCKG="cd ~/Desktop/Bckg/"
alias MAIL="cd /var/log/mail"
alias ETC="cd /etc"

alias WWW="cd /var/www/src/"
alias HTTP="cd /var/www/http/"

alias SRC="cd /var/www/src/"
alias NGTU="cd /var/www/src/NGTU2"
alias CROWD="cd /var/www/src/CareerCrowd"
alias MANTA="cd /var/www/src/mantaapp"
alias MANTA2="cd /var/www/src/mantaapp2"
alias MANTAAPI="cd /var/www/src/mantaapi"
alias MANTASTATIC="cd /var/www/src/manta-static"
alias MANTABANK="cd /var/www/src/bank-service"
alias SPACESPY="cd /var/www/src/spaceSpy"
alias ATS="cd /var/www/src/ats"
alias ENROLA="cd /var/www/src/ats"
alias SLIPCASE="cd /var/www/src/feed"
alias FEED="cd /var/www/src/feed"
alias CLEAN="cd /var/www/src/clean"
alias TEST="cd /var/www/src/test"
alias TIW="cd /var/www/src/tiw"
alias TEMPLATE="cd /var/www/src/symfony/framework-standard-edition/"
alias CRASH="cd /var/crash"
alias LUCID="cd /var/www/src/lucid-frontend"
alias LUCIDAPI="cd /var/www/src/lucid-backend"
alias EVERBOX="cd /var/www/src/everBox"
alias SMOOF="cd /var/www/src/smoof"
alias VERTEX="cd /var/www/src/vertex"
alias VAPE="cd /var/www/src/vape"

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

function LAST() {
    fc -ln "$1" "$1" | sed '1s/^[[:space:]]*//'
}

directory=/home/kerberos/history/
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
export PATH=${PATH}:/home/kerberos/vert.x-2.1.5/bin/
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export PATH=${PATH}:${JAVA_HOME}/bin
PATH=${PATH}:${HOME}/Desktop/Everlution/script
