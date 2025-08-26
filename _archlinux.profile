# archlinux - special things for that 
#
# ls is aliased to something else, to get the real ls:
alias _ls=/usr/bin/ls 

alias update-mirros="sudo pacman -Syy"
alias upgrada-system="sudo pacman -Syu"


# ls nonsense
# DHH had to mess with ls and use eza which is pretty, but it doesn't use the 
# same command line switches as ls. My grumble is  `ls -latr` doesn't work 
# It appears that eza is easily installed on ubuntu but i haven't found it
# in the default repositories, at least, on fedora. 
# alias ls='eza -lh --group-directories-first --icons=auto'
