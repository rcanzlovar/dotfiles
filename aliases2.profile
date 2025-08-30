
# who needs to use sudo to install shit
alias yum='sudo yum'
alias apt='sudo apt'

# hs - save history to a dated file 
# cl - change log - writes host-specific change file by date, comment time stamped inside
# ms - my status - writes change file by date, comment time stamped inside with host nae 

CHANGELOG_DIR="$HOME/.changelog/"
[  -d $CHANGELOG_DIR ] || mkdir $CHANGELOG_DIR
alias hs="history > $CHANGELOG_DIR/.hist-\$( date '+%Y%m%d%H%M' )-\$( uname -n ).txt"
alias cl='export CHANGEFILE=$CHANGELOG_DIR/change-\$(date "+%Y%m%d")-\$(uname -n).txt; touch $CHANGEFILE;printf "\n# "\$(uname -n)" "\$(date "+%Y-%m-%d-%H:%M") >>$CHANGEFILE; vim $CHANGEFILE'
alias ms='export STATUSFILE=$CHANGELOG_DIR/status-\$(date "+%Y%m%d").txt; touch $STATUSFILE;printf "\n# "\$(uname -n)" "\$(date "+%Y-%m-%d-%H:%M") >>$STATUSFILE; vim $STATUSFILE'


# howto snippets.. ht by itself goes to default, 'ht foo' adds or creates a foo howto file 
alias ht='function __myalias() { 
    if [[ -n $1 ]] ; 
    then howto=$( echo $1|sed -e "s/ /_/g" ).md; 
    else howto="default.md"; 
    fi; 
    local HOWTOFILE="$HOME/howto/$howto";
    vim  $HOWTOFILE; 
    unset -f __myalias;
    unset -v howto;
    return $myresult; 
    }; 
    __myalias'

alias md='function __myalias() {
    if [[ -n $1 ]] ;
    then displayfile=$1;
    else break; fi; 
    pandoc $displayfile |lynx -stdin
    unset -f __myalias;
    unset -v displayfile; }; __myalias'

alias mdd='function __myalias() { 
    if [[ -n $1 ]] ; 
    then howto=$1.md; 
    else howto="default.md"; fi; 
    local HOWTOFILE=~/howto/$howto;pandoc  $HOWTOFILE| lynx -stdin; 
    unset -f __myalias;
    unset -v howto;
    return $myresult; }; __myalias'


alias diary='function __mydiary() { 
    local DIARY_DIR=~/.diary
    [ ! -d ${ DIARY_DIR} ] && mkdir ${DIARY_DIR}
	local DIARYFILE=$DIARY_DIR/$(date "+%Y")/$(date "+%m")/$(date "+%d").md;
	if [[ -n $DIARYFILE ]]; then 
	    mkdir  -p $(echo $DIARYFILE| cut -d"/" --complement -f 7);
	    touch $DIARYFILE;
	fi; 
	echo "# \$(date "+%Y-%m-%d %H:%M")" >> $DIARYFILE


	vim $DIARYFILE
	unset -f __mydiary
}; __mydiary '  

# repack an epub... 
#alias epubber="zip -rX \"../$(basename \\\"$(realpath .)).epub\" mimetype $(ls|xargs echo|sed 's/mimetype//g')"


# bash function to validate IP from https://lzone.de/cheat-sheet/Bash%20Regex
# expects x.x.x.x/x 
function validate_ip {
        local net=$1
        [[ $net =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/[0-9]{1,2}$ ]] || return 1 # check 999.999.999.999 but not the range
        [[ ${net#*/} -le 32 ]] || return 1 # check the subnet mask 
        local ip=${net%/*}
        local -a oc=(${ip//\./ })
        [[ ${oc[0]} -le 255 && ${oc[1]} -le 255 && ${oc[2]} -le 255 && ${oc[3]} -le 255 ]] || return 1 # check that the values are in range
        return 0 # if you made it here, it's a valid IP address
}
