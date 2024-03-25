#!/bin/sh	

# PROMPT_DIRTRIM
#If set to a number greater than zero, the value is used as the number 
#of trailing directory components to retain when expanding the \w and \W 
#prompt string escapes (see PROMPTING below).  Characters removed are 
#replaced with an ellipsis.
# 2 means we show the current dir and one above 
export PROMPT_DIRTRIM=3

RELEASE="\[\033[01;38;5;50m\] `lsb_release -d| awk ' { for (i=2; i<=NF; i++)   printf  $i" " }'; `" 

UNAME="\[\033[01;38;5;40m\]`uname -m`" 

# some colors
    turquoise="\[\033[01;38;5;50m\]" 
    green="\[\033[01;38;5;40m\]" 
    red="\[\033[01;38;5;1m\]"
    yellow="\[\033[01;38;5;11m\]"
    mustard="\[\e[1;33m\]"
    blue="\[\033[01;38;5;38m\]"

#Set prompt to indicate shell, user, host, and dir
if [ "$USER" = "rca" ]; then
    c="${yellow}c"
    r="${red}r"
    a="${blue}a"
    a="\[\033[01;38;5;38m\]a"
    __user__="$r$c$a"
elif [ "$USER" = "banzlova" ]; then
    b="\[\033[01;38;5;52m\]b"
    a="\[\033[01;38;5;124m\]a"
    n="\[\033[01;38;5;196m\]n"
    z="\[\033[01;38;5;202m\]z"
    l="\[\033[01;38;5;208m\]l"
    o="\[\033[01;38;5;214m\]o"
    v="\[\033[01;38;5;220m\]v"
    a2="\[\033[01;38;5;223m\]a"
    __user__="$b$a$n$z$l$o$v$a2"
elif [ "$USER" = "rcanzlovar" ]; then
    r="\[\033[01;38;5;52m\]r"
    c="\[\033[01;38;5;124m\]c"
    a="\[\033[01;38;5;196m\]a"
    n="\[\033[01;38;5;202m\]n"
    z="\[\033[01;38;5;208m\]z"
    l="\[\033[01;38;5;210m\]l"
    o="\[\033[01;38;5;214m\]o"
    v="\[\033[01;38;5;220m\]v"
    a2="\[\033[01;38;5;223m\]a"
    r2="\[\033[01;38;5;226m\]r"
    __user__="$r$c$a$n$z$l$o$v$a2$r2"
else
    __user__="\[\033[01;36m\]\u"
fi

# if we can write to /etc/profile we must be kind of a big deal
if [ -w /etc/profile ]; then
        case $LOGNAME in
                root) __user__="\[\033[01;52\] ROOT";;
                *) __user__="\[\033[01;52\] SuperUser \u";;
        esac
fi

# \e[0;124m

# export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "

#PS1="\d \t\n\u@\h:\w\n\$ "
#PS1="\[\e]0;\w\a\]\d \t\n\[\e[35m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\n\$ "
#PS1="\[\e]0;\w\a\]\d \t\n$__user__@\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

#PS1="\[\e[0;33m\]\d \t\[\e[0m\]\n$__user__\[\033[01;38;5;46m\]@\[\033[01;38;5;38m\]\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

ENDSTRING='\[\e[0m\]'

HOSTSTRING=
case $HOSTNAME in 
	penguin) HOSTSTRING='\[\033[01;38;5;208m\]\h';;
	homenas) HOSTSTRING='\[\033[01;38;5;130m\]\h';;
	huey) HOSTSTRING='\[\033[01;38;5;120m\]\h';;
	hal) HOSTSTRING='\[\033[01;38;5;14m\]\h';;
	edgar) HOSTSTRING='\[\033[01;38;5;9m\]\h';;
	colossus) HOSTSTRING='\[\033[01;38;5;24m\]\h';;
	*blue*) HOSTSTRING='\[\033[01;38;5;97m\]\h';;
	*gator*) HOSTSTRING='\[\033[01;38;5;114m\]\h';;
	*) HOSTSTRING='\[\033[01;38;5;38m\]\h';;
esac


DATESTRING="\[\e[1;33m\]\D{%a, %e-%b-%Y %k:%M:%S %Z %z}${ENDSTRING}"
DATESTRING="${mustard}\D{%a, %e-%b-%Y %k:%M:%S %Z %z}${ENDSTRING}"

LOCSTRING="\[\e[0;40m\]\w${ENDSTRING}"
LOCSTRING="\[\e[0;31m\]\w${ENDSTRING}"
LOCSTRING="\[\e[01;34m\]\w${ENDSTRING}"
# 0 = normal brightness? 
# 1 = brighter 
# 2 = dimmer 
# 3 = italics
# 4 = underline
# 5 = blink

# Use lolcat, if available, to prettify the hostname part of the prompt
LOLCAT=/usr/games/lolcat
AMPERSAND='@'
if [[ -f "$LOLCAT" ]]; then
    HOSTSTRING=`echo "${HOSTNAME}" | $LOLCAT -f`
    AMPERSAND=`echo "${AMPERSAND}" | $LOLCAT -f`
fi


export PS1="${DATESTRING}\n$__user__$ENDSTRING\[\033[01;38;5;46m\]@${HOSTSTRING}\[\033[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
export PS1="${DATESTRING}\n$__user__$ENDSTRING\[\033[01;38;5;46m\]${AMPERSAND}${HOSTSTRING}\[\033[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
#export PS1="${DATESTRING}\n$__user__\[\033[01;38;5;46m\]@${HOSTSTRING}\[\033[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
export PS1="${DATESTRING}\n ${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}
$__user__$ENDSTRING\[\033[01;38;5;46m\]${AMPERSAND}${HOSTSTRING}\[\033[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
#PS1="\s \u \h:\w\$ "





# Kali linux PS1 stuff: 

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=rcaclassic
NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    prompt_color='\[\033[1;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol=㉿
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\033[;94m\]'
        info_color='\[\033[1;31m\]'
        # Skull emoji for root terminal
        prompt_symbol=💀
    fi
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')-}('$info_color'\u'$prompt_symbol'\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']\n├──'${DATESTRING}'\n'$prompt_color'└─'$info_color'\$\[\033[0m\] ';;
        oneline)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}'$info_color'\u@\h\[\033[00m\]:'$prompt_color'\[\033[01m\]\w\[\033[00m\]\$ ';;
        backtrack)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
        rcaclassic)
            PS1="${DATESTRING}\n$__user__$ENDSTRING\[\033[01;38;5;46m\]${AMPERSAND}${HOSTSTRING}\[\033[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING} ${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV))} \n\$ "
#PS1="\s \u \h:\w\$ "
    esac
    unset prompt_color
    unset info_color
    unset prompt_symbol
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

