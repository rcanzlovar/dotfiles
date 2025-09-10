
#!/bin/sh

# PROMPT_DIRTRIM
#If set to a number greater than zero, the value is used as the number
#of trailing directory components to retain when expanding the \w and \W
#prompt string escapes (see PROMPTING below).  Characters removed are
#replaced with an ellipsis.
# 2 means we show the current dir and one above
export PROMPT_DIRTRIM=3

#RELEASE="\[\e[01;38;5;50m\] `lsb_release -d| awk ' { for (i=2; i<=NF; i++)   printf  $i" " }'; `"
RELEASE="\[\e[01;38;5;50m\] mobaxterm"


# what kind of environment is this?
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    MSYS_NT*)   MACHINE=MSys;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

#
if command -v lsb_release &> /dev/null
then
    RELEASE="\[\e[01;38;5;50m\] ${MACHINE} `lsb_release -d| awk ' { for (i=2; i<=NF; i++)   printf  $i" " }'; `"
elif [ -f /etc/fedora-release ]
then
    RELEASE="\[\e[01;38;5;50m\] ${MACHINE} ` cat /etc/fedora-release `"
else
    RELEASE="\[\e[01;38;5;50m\] ${MACHINE}"
fi


UNAME="\[\e[01;38;5;40m\]`uname -m`"

# some colors
    turquoise="\[\e[01;38;5;50m\]"
    green="\[\e[01;38;5;40m\]"
    red="\[\e[01;38;5;1m\]"
    yellow="\[\e[01;38;5;11m\]"
    mustard="\[\e[1;33m\]"
    blue="\[\e[01;38;5;38m\]"

#Set prompt to indicate shell, user, host, and dir
if [ "$USER" = "rca" ]; then
    r="${red}r"
    c="${yellow}c"
    a="${blue}a"
    __user__="$r$c$a"
elif [ "$USER" = "robertanzlov" ]; then
    # Micron
    ro="\[\e[01;38;5;52m\]ro"
    be="\[\e[01;38;5;124m\]be"
    rt="\[\e[01;38;5;196m\]rt"
    an="\[\e[01;38;5;202m\]an"
    zl="\[\e[01;38;5;208m\]zl"
    ov="\[\e[01;38;5;214m\]ov"
    __user__="$ro$be$rt$an$zl$ov"
elif [ "$USER" = "banzlova" ]; then
    # Western Digital
    b="\[\e[01;38;5;52m\]b"
    a="\[\e[01;38;5;124m\]a"
    n="\[\e[01;38;5;196m\]n"
    z="\[\e[01;38;5;202m\]z"
    l="\[\e[01;38;5;208m\]l"
    o="\[\e[01;38;5;214m\]o"
    v="\[\e[01;38;5;220m\]v"
    a2="\[\e[01;38;5;223m\]a"
    __user__="$b$a$n$z$l$o$v$a2"
elif [ "$USER" = "rcanzlovar" ]; then
    r="\[\e[01;38;5;52m\]r"
    c="\[\e[01;38;5;124m\]c"
    a="\[\e[01;38;5;196m\]a"
    n="\[\e[01;38;5;202m\]n"
    z="\[\e[01;38;5;208m\]z"
    l="\[\e[01;38;5;210m\]l"
    o="\[\e[01;38;5;214m\]o"
    v="\[\e[01;38;5;220m\]v"
    a2="\[\e[01;38;5;223m\]a"
    r2="\[\e[01;38;5;226m\]r"
    __user__="$r$c$a$n$z$l$o$v$a2$r2"
else
    __user__="\[\e[01;36m\]\u"
fi

# if we can write to /etc/profile we must be kind of a big deal
if [ -w /etc/profile ]; then
    # if we can edit /etc/profile we must be badass
        case $LOGNAME in
                root) __user__="\[\e[01;52m\] ROOT";;
                *) __user__="\[\e[01;52m\]SuperUser \u";;
        esac
fi

# \e[0;124m

# export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "

#PS1="\d \t\n\u@\h:\w\n\$ "
#PS1="\[\e]0;\w\a\]\d \t\n\[\e[35m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\n\$ "
#PS1="\[\e]0;\w\a\]\d \t\n$__user__@\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

#PS1="\[\e[0;33m\]\d \t\[\e[0m\]\n$__user__\[\e[01;38;5;46m\]@\[\e[01;38;5;38m\]\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

ENDSTRING='\[\e[0m\]'

HOSTSTRING=
case $HOSTNAME in
        penguin) HOSTSTRING='\[\e[01;38;5;208m\]\h';;
        homenas) HOSTSTRING='\[\e[01;38;5;130m\]\h';;
        huey) HOSTSTRING='\[\e[01;38;5;120m\]\h';;
        hal) HOSTSTRING='\[\e[01;38;5;14m\]\h';;
        edgar) HOSTSTRING='\[\e[01;38;5;9m\]\h';;
        colossus) HOSTSTRING='\[\e[01;38;5;24m\]\h';;
        *blue*) HOSTSTRING='\[\e[01;38;5;97m\]\h';;
        *gator*) HOSTSTRING='\[\e[01;38;5;114m\]\h';;
        *) HOSTSTRING='\[\e[01;38;5;38m\]\h';;
esac


DATESTRING="\[\e[01;33m\]\D{%a, %e-%b-%Y %k:%M:%S %Z %z}${ENDSTRING}"
#DATESTRING="${mustard}\D{%a, %e-%b-%Y %k:%M:%S %Z %z}${ENDSTRING}"

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
# Use lolcat, if available, to prettify the hostname part of the prompt
#
if [ -f /usr/games/lolcat ]; then
    LOLCAT=/usr/games/lolcat
elif [ -f /usr/binx/lolcat ]; then
    LOLCAT=/usr/bin/lolcat
fi

AMPERSAND='@'
if [[ -f "$LOLCAT" ]]; then
    HOSTSTRING=`echo "${HOSTNAME}" | $LOLCAT -f | tr -d '\n'`
    AMPERSAND=`echo "${AMPERSAND}" | $LOLCAT -f | tr -d '\n'`
fi


export PS1="${DATESTRING}\n$__user__$ENDSTRING\[\e[01;38;5;46m\]@${HOSTSTRING}\[\e[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
export PS1="${DATESTRING}\n$__user__$ENDSTRING\[\e[01;38;5;46m\]${AMPERSAND}${HOSTSTRING}\[\e[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
#export PS1="${DATESTRING}\n$__user__\[\e[01;38;5;46m\]@${HOSTSTRING}\[\e[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
export PS1="${DATESTRING}\n ${VIRTUAL_ENV:+(\[\e[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}
$__user__$ENDSTRING\[\e[01;38;5;46m\]${AMPERSAND}${HOSTSTRING}\[\e[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING}\n\$ "
#PS1="\s \u \h:\w\$ "





# Kali linux PS1 stuff:

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if  [ -f /usr/bin/tput ] &&  [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    elif [ "$MACHINE" == "Cygwin" ]; then
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

    prompt_color='\[\e[1;32m\]'
    info_color='\[\e[1;34m\]'
    prompt_symbol=㉿
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\e[;94m\]'
        info_color='\[\e[1;31m\]'
        # Skull emoji for root terminal
        prompt_symbol=💀
    fi
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\e[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')-}('$info_color'\u'$prompt_symbol'\h'$prompt_color')-[\[\e[0;1m\]\w'$prompt_color']\n├──'${DATESTRING}'\n'$prompt_color'└─'$info_color'\$\[\e[0m\] ';;
        oneline)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}'$info_color'\u@\h\[\e[00m\]:'$prompt_color'\[\e[01m\]\w\[\e[00m\]\$ ';;
        backtrack)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}\[\e[01;31m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ ';;
        rcaclassic)
            PS1="${prompt_symbol} ${DATESTRING}\n$__user__$ENDSTRING\[\e[01;38;5;46m\]${AMPERSAND}${HOSTSTRING}\[\e[05;38;5;38m\]:${ENDSTRING}${LOCSTRING} ${RELEASE} ${UNAME}${ENDSTRING} ${VIRTUAL_ENV:+(\[\e[0;1m\]$(basename $VIRTUAL_ENV))} \n\$ "
#PS1="\s \u \h:\w\$ "
    esac
    unset prompt_color
    unset info_color
    unset prompt_symbol
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
