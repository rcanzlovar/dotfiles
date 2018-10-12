#!/bin/sh	

#Set prompt to indicate shell, user, host, and dir
if [ "$USER" = "banzlova" ]; then
    b="\[\033[01;38;5;52m\]b"
    a="\[\033[01;38;5;124m\]a"
    n="\[\033[01;38;5;196m\]n"
    z="\[\033[01;38;5;202m\]z"
    l="\[\033[01;38;5;208m\]l"
    o="\[\033[01;38;5;214m\]o"
    v="\[\033[01;38;5;220m\]v"
    a2="\[\033[01;38;5;226m\]a"
    __user__="$b$a$n$z$l$o$v$a2"
else
    __user__="\[\033[01;36m\]\u"
fi

# \e[0;124m

# export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "

PS1="\d \t\n\u@\h:\w\n\$ "
PS1="\[\e]0;\w\a\]\d \t\n\[\e[35m\]\u@\h:\[\e[33m\]\w\[\e[0m\]\n\$ "
PS1="\[\e]0;\w\a\]\d \t\n$__user__@\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "
PS1="\[\e[0;33m\]\d \t\[\e[0m\]\n$__user__\[\033[01;38;5;46m\]@\[\033[01;38;5;38m\]\h:\[\e[0;35m\]\w\[\e[0m\]\n\$ "
#PS1="\s \u \h:\w\$ "
# if LE Root, make that really clear:
if [ -w /etc/profile ]; then
        case $LOGNAME in
                root) PS1="\s ROOT \h:\w# ";;
                leroot) PS1="\s LE Root \h:\w# ";;
                *) PS1="\s SuperUser \h:\w# ";;
        esac
fi
export PS1
