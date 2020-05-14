  PATH=${HOME}/.local/bin:${HOME}/bin:${PATH}:/usr/local/bin
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
