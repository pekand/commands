#!/bin/bash

#if [ -f $HOME/commands/bashrc ]; then
#    . $HOME/commands/bashrc
#fi

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
else
  PS1="\[\e[1;32m\]\$PWD:\[\e[m\]\[\e[1;33m\]"
  trap 'printf "\e[0m" "$_"' DEBUG
fi

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

DISTRO="unknown"
SERVERUSER="www-data"
if python3 -mplatform | grep Ubuntu >> /dev/null ; then
     DISTRO="ubuntu"
     SERVERUSER="www-data"
fi

if python3 -mplatform | grep Centos >> /dev/null ; then
     DISTRO="centos"
     SERVERUSER="apache"
fi

function APACHE {
	if [ "$DISTRO" = "ubuntu" ] ; then
		cd /etc/apache2/sites-available/
	fi

	if [ "$DISTRO" = "centos" ] ; then
		sudo subl /etc/httpd/conf/httpd.conf
	fi
}  

function PHP {
	if [ "$DISTRO" = "ubuntu" ] ; then
		sudo subl  /etc/php5/apache2/php.ini
		sudo subl  /etc/php5/cli/php.ini
		sudo subl  /etc/php/7.0/apache2/php.ini
		sudo subl  /etc/php/7.0/apache2/php.ini
		
	fi

	if [ "$DISTRO" = "centos" ] ; then
		sudo subl subl /etc/php.ini
	fi
}  

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

directory=~/history/
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
