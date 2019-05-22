# less utility customizations
# start less at the bottom of the file
alias lessb='less +G'

# prevent tput errors 
## tput: No value for $TERM and no -T specified

if [[ $TERM != "" ]] 
then

# Get color support for 'less'
# R: raw control char, e: exit, i: ignore case, g: hilite search, z: scroll
export LESS="FRXigz-4 --RAW-CONTROL-CHARS"

# Add color in manpages for less
##export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green

##export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan

export LESS_TERMCAP_me=$(tput sgr0)
##export LESS_TERMCAP_me=$'\E[0m'

##export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue

##export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)

##export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white

##export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)

export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1         # For Konsole and Gnome-terminal

# Use colors for less, man, etc.
##[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP



fi
