# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
unalias grep  2>/dev/null
unalias egrep 2>/dev/null
unalias fgrep 2>/dev/null

HN=`uname -n`
# note: on my personal workstation, /home/le/admin/bin sometimes isn't accessible
case $HN in
  *pjc*|*pcain*) PATH=${HOME}/bin:${PATH}:/usr/local/bin:/usr/local/admin/bin;;
  *)  PATH=${HOME}/bin:${PATH}:/usr/local/bin:/usr/local/admin/bin:/home/le/admin/bin
      # many systems don't recognize 'xterm-256color' very well.
      case $TERM in
        xterm-*) TERM=xterm;;
      esac
      ;;
esac
# set up LD_LIBRARY_PATH
# let the shell wild cards tell us what is on this system
TPATH="/usr/li[b] /usr/lib[0-9][0-9] /usr/ucb/li[b] /usr/xpg4/li[b] /usr/sfw/li[b] /usr/dt/li[b] /usr/openwin/li[b] /usr/ccs/li[b] /opt/*/li[b] /usr/local/li[b]"
TPATH=`echo $TPATH | tr ' ' '\012' | grep -v '\['`
#if [ ! -z "$LD_LIBRARY_PATH" ]; then
#  LD_LIBRARY_PATH=`echo $TPATH | tr ' ' ':'`
#else
#  LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:`echo $TPATH | tr ' ' ':'`
#fi
unset TPATH
export LD_LIBRARY_PATH

# used in getFsGui.sh
#SSH_USER=pcain; export SSH_USER

unset LS_COLORS
unalias ls > /dev/null 2>&1
alias cdev='cat > /dev/null'
alias h='history | tail'
alias ll='/bin/ls -alF'
alias lld='/bin/ls -alFd'
alias llr='/bin/ls -alFtr'
alias llt='/bin/ls -alFt'
alias lltr='/bin/ls -laFtr'
alias llu='/bin/ls -alFut'
alias ls='/bin/ls'
alias lth='/bin/ls -laFt | head'
alias ltr='/bin/ls -alFtr'
case `uname` in
  Linux*) alias ping='ping -c 2'
          alias spell='hunspell -l'
          ;;
esac
alias larscli='/home/le/bin/larscli'
alias powermanbeta='/home/le/bin/powermanbeta'
alias powerman='/home/le/bin/powerman'
alias portman='/home/le/bin/portman'
alias vi='/bin/vi'

alias sdb='ssh leroot@ledbm'
alias srh5='ssh pcain@co-labrh5vm-01'
alias sume='sudo su - root'
alias suml='sudo su - leroot'
alias sweb='ssh leroot@labutils'
alias swebs='ssh lesafe@labutils'

# CO App
alias s1='ssh leroot@co-appsvr-01'
alias s1s='ssh lesafe@co-appsvr-01'
alias s2='ssh leroot@co-appsvr-02'
alias s2s='ssh lesafe@co-appsvr-02'
alias s3='ssh leroot@co-appsvr-03'
alias s3s='ssh lesafe@co-appsvr-03'
alias s4='ssh leroot@co-appsvr-04'
alias s4s='ssh lesafe@co-appsvr-04'
alias s5='ssh leroot@co-appsvr-05'
alias s5s='ssh lesafe@co-appsvr-05'
alias s6='ssh leroot@co-appsvr-06'
alias s6s='ssh lesafe@co-appsvr-06'

# BG App and Lab Lin
alias sbg1='ssh leroot@bg-appsvr-01.in.oracle.com'
alias sbg2='ssh leroot@bg-appsvr-02.in.oracle.com'
alias sbg3='ssh leroot@bg-appsvr-03.in.oracle.com'
alias sbg4='ssh leroot@bg-appsvr-04.in.oracle.com'
alias sbg5='ssh leroot@bg-appsvr-05.in.oracle.com'
alias sbg6='ssh leroot@bg-appsvr-06.in.oracle.com'
alias sbl1='ssh pcain@bg-lablin-01.in.oracle.com'

# CA App
alias ssa1='ssh leroot@ca-appsvr-01'
alias ssa2='ssh leroot@ca-appsvr-02'
alias ssa3='ssh leroot@ca-appsvr-03'
alias ssa4='ssh leroot@ca-appsvr-04'
alias ssa5='ssh leroot@ca-appsvr-05'
alias ssa6='ssh leroot@ca-appsvr-06'
alias ssa10='ssh leroot@ca-appsvr-10'

# Lab Lin
alias ss1='ssh pcain@co-lablin-01'
alias ss2='ssh pcain@co-lablin-02'
alias ss3='ssh pcain@co-lablin-03'
alias ss4='ssh pcain@co-lablin-04'
alias ssc1='ssh pcain@ca-lablin-01'
alias ssc2='ssh pcain@ca-lablin-02'
alias ssc3='ssh pcain@ca-lablin-03'
alias ssc4='ssh pcain@ca-lablin-04'

# x86 Dev ENV
alias s1d='ssh leroot@co-ledevsvr-01'
alias s2d='ssh leroot@co-ledevsvr-02'
alias s3d='ssh leroot@co-ledevsvr-03'
alias s4d='ssh leroot@co-ledevsvr-04'
alias s5d='ssh leroot@co-ledevsvr-05'
alias s6d='ssh leroot@co-ledevsvr-06'

