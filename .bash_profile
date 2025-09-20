# .bash_profile

HN=`uname -n`
OS=`uname`


# for Cygwin, do only these and return
case $OS in
  CYG*)
alias   ll='ls -laF'
alias  llt='ls -laFt'
alias  lltr='ls -laFtr'
alias  llr='ls -laFtr'
alias  llu='ls -laFut'
alias  lld='ls -laFd'
alias  lth='ls -laFt | head'
alias    h='history | tail'
alias cdev='cat > /dev/null'
alias more='less --quit-at-eof --quit-if-one-screen'
return
;;
esac

# Get the aliases and functions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#if [ -s $HOME/.bashrc ]; then . $HOME/.bashrc; fi
if [ -s $HOME/.bash_aliases ]; then . $HOME/.bash_aliases; fi

case `uname` in
  Linux*) alias ping='ping -c 2'
          alias spell='hunspell -l'
          ;;
esac

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/sbin:/usr/sbin
BASH_ENV=$HOME/.bashrc
export BASH_ENV PATH
unset USERNAME
##### 




# sets the paths of MANPATH, LD_LIBRARY_PATH, and PATH
# sets several useful aliases

# for user 'le', this is "admin/.bash_profile_all"
# for other users, it can be copied in as their .bash_profile
# and it will update itself at each login



PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/ucb:/usr/ccs/bin:/usr/local/mysql/bin:/home/le/admin/bin:/home/le/bin

# set up PATH
# let the shell wild cards tell us what is on this system
TPATH="/sbi[n] /usr/sbi[n] /bi[n] /usr/bi[n] /usr/uc[b] /usr/local/admin/bi[n] $HOME/bi[n]  /usr/local/sbi[n] /usr/local/bi[n] /usr/xpg4/bi[n] /usr/ccs/bi[n] :/home/le/admin/bi[n] /home/le/bi[n] /usr/platform/`uname -i`/sbi[n] /opt/*/sbi[n] /opt/*/bi[n]"
TPATH=`echo $TPATH | tr ' ' '\012' | grep -v '\['`
PATH=`echo $TPATH | tr ' ' ':'`
unset TPATH
export PATH

# set up MANPATH
# let the shell wild cards tell us what is on this system
TPATH="/usr/share/ma[n] /usr/dt/share/ma[n] /usr/openwin/share/ma[n] /opt/*/ma[n] /usr/local/ma[n] /usr/local/*/ma[n]"
TPATH=`echo $TPATH | tr ' ' '\012' | grep -v '\['`
MANPATH=`echo $TPATH | tr ' ' ':'`
unset TPATH
export MANPATH

# set up LD_LIBRARY_PATH
# let the shell wild cards tell us what is on this system
TPATH="/usr/li[b] /usr/lib[0-9][0-9] /usr/ucb/li[b] /usr/xpg4/li[b] /usr/ccs/li[b] /opt/*/li[b] /usr/local/li[b]"
TPATH=`echo $TPATH | tr ' ' '\012' | grep -v '\['`
LD_LIBRARY_PATH=`echo $TPATH | tr ' ' ':'`
unset TPATH
export LD_LIBRARY_PATH
####

# editors set up in ~/.d/default.profile
# EDITOR=vi; export EDITOR

alias   ll='ls -laF'
alias  llt='ls -laFt'
alias  lltr='ls -laFtr'
alias  llr='ls -laFtr'
alias  llu='ls -laFut'
alias  lld='ls -laFd'
alias  lth='ls -laFt | head'
alias    h='history | tail'
alias cdev='cat > /dev/null'
alias vi='/bin/vi'
alias ls='/bin/ls'
alias pilotr=/home/le/admin/bin/run_cmd_on_pilot.sh
alias powerman=/home/le/bin/powerman
case $OS in
  Linux|SunOS) /bin/true;; # continue with PATH stuff
  * ) return;;
esac

FROM_HOST=$(who am i | awk '{print $NF}' | tr -d '()')
if [ -z "$DISPLAY" ]; then
  DISPLAY=${FROM_HOST}:0.0; export DISPLAY
fi



function colorgrid( )
{
    iter=16
    while [ $iter -lt 52 ]
    do
        second=$[$iter+36]
        third=$[$second+36]
        four=$[$third+36]
        five=$[$four+36]
        six=$[$five+36]
        seven=$[$six+36]
        if [ $seven -gt 250 ];then seven=$[$seven-251]; fi

        echo -en "\033[38;5;$(echo $iter)m█ "
        printf "%03d" $iter
        echo -en "   \033[38;5;$(echo $second)m█ "
        printf "%03d" $second
        echo -en "   \033[38;5;$(echo $third)m█ "
        printf "%03d" $third
        echo -en "   \033[38;5;$(echo $four)m█ "
        printf "%03d" $four
        echo -en "   \033[38;5;$(echo $five)m█ "
        printf "%03d" $five
        echo -en "   \033[38;5;$(echo $six)m█ "
        printf "%03d" $six
        echo -en "   \033[38;5;$(echo $seven)m█ "
        printf "%03d" $seven

        iter=$[$iter+1]
        printf '\r\n'
    done
}

# Load from .d.
if [[ -d ~/.d ]]; then
  for profile in $HOME/.d/*.profile; do
    source $profile
  done
  unset profile;
fi

