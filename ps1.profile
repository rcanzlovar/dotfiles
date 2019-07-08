#!/bin/sh	

# PROMPT_DIRTRIM
#If set to a number greater than zero, the value is used as the number 
#of trailing directory components to retain when expanding the \w and \W 
#prompt string escapes (see PROMPTING below).  Characters removed are 
#replaced with an ellipsis.
# 2 means we show the current dir and one above 
export PROMPT_DIRTRIM=2


#Set prompt to indicate shell, user, host, and dir
if [ "$USER" = "rca" ]; then
    r="\[\033[01;38;5;1m\]r"
    c="\[\033[01;38;5;11m\]c"
    a="\[\033[01;38;5;18m\]a"
    __user__="$r$c$a"
elif [ "$USER" = "banzlova" ]; then
    b="\[\033[01;38;5;52m\]b"
    a="\[\033[01;38;5;124m\]a"
    n="\[\033[01;38;5;196m\]n"
    z="\[\033[01;38;5;202m\]z"
    l="\[\033[01;38;5;208m\]l"
    o="\[\033[01;38;5;214m\]o"
    v="\[\033[01;38;5;220m\]v"
    __user__="$b$a$n$z$l$o$v$a2"
elif [ "$USER" = "banzlova" ]; then
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

if [ -w /etc/profile ]; then
        case $LOGNAME in
                root) __user__="\[\033[01;52\] ROOT";;
                leroot) __user__="\[\033[01;52\] LeRoot";;
                *) __user__="\[\033[01;52\] SuperUser \u";;
        esac
fi

# \e[0;124m

# export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "

#PS1="\d \t\n\u@\h:\w\n\$ "
#PS1="\[\e]0;\w\a\]\d \t\n\[\e[35m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\n\$ "
#PS1="\[\e]0;\w\a\]\d \t\n$__user__@\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

#PS1="\[\e[0;33m\]\d \t\[\e[0m\]\n$__user__\[\033[01;38;5;46m\]@\[\033[01;38;5;38m\]\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

HOSTSTRING=
case $HOSTNAME in 
	BANZLOVA-US) HOSTSTRING='\[\033[01;38;5;208m\]\h';;
	co-rcalab-01) HOSTSTRING='\[\033[01;38;5;14m\]\h';;
	*) HOSTSTRING='\[\033[01;38;5;38m\]\h';;
esac

export PS1="\[\e[0;33m\]\D{%a, %e-%b-%Y %k:%M:%S %Z %z}\[\e[0m\]\n$__user__\[\033[01;38;5;46m\]@$HOSTSTRING\[\033[01;38;5;38m\]:\[\e[0;35m\]\w\[\e[0m\]\n\$ "

#PS1="\s \u \h:\w\$ "
