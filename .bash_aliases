## bashmarks is like my old go command
## https://github.com/huyng/bashmarks
source ~/.local/bin/bashmarks.sh

alias md='pandoc coldstart-procs.md |lynx -stdin'
alias yum='sudo yum'

# hs - save history to a dated file 
# cl - change log - writes host-specific change file by date, comment time stamped inside
# ms - my status - writes change file by date, comment time stamped inside with host nae 
alias hs='history > ~banzlova/.changelog/.hist-`date "+%Y%m%d%H%M"`-`uname -n`.txt'
alias cl='hs;export CHANGEFILE=~banzlova/.changelog/change-`date "+%Y%m%d"`-`uname -n`.txt; touch $CHANGEFILE;printf "\n# "`uname -n`" "`date "+%Y-%m-%d-%H:%M"` >>$CHANGEFILE; vi $CHANGEFILE'
alias ms='hs;export STATUSFILE=~banzlova/.changelog/status-`date "+%Y%m%d"`.txt; touch $STATUSFILE;printf "\n# "`uname -n`" "`date "+%Y-%m-%d-%H:%M"` >>$STATUSFILE; vi $STATUSFILE'


# howto snippets.. ht by itself goes to default, 'ht foo' adds or creates a foo howto file 
alias ht='function __myalias() { if [[ -n $1 ]] ; then howto=$1.md; else howto="default"; fi; local HOWTOFILE=~banzlova/.howto/$howto;vi  $HOWTOFILE; unset -f __myalias;unset -v howto;return $myresult; }; __myalias'
alias mdd='function __myalias() { if [[ -n $1 ]] ; then howto=$1.md; else howto="default"; fi; local HOWTOFILE=~banzlova/.howto/$howto;pandoc  $HOWTOFILE|lynx -stdin;unset -f __myalias;unset -v howto;return $myresult; }; __myalias'


alias rdp='rdesktop -u banzlova co-rcalab-01 -g 1920x1040 '
alias rdpi='rdesktop -u banzlova 10.79.160.101 -g 1920x1040 '
