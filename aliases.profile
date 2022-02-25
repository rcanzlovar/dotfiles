
# ssh to host with VPN tunnel for VNC
alias hputunnel="ssh -p 2222  -L 5901:localhost:5901 rca@192.168.23.45"
# get a quick overview of what's on this box
alias show-systeminfo="ifconfig -a; grep MemTotal: /proc/meminfo; uname -r; grep model.name /proc/cpuinfo"

# Find out what is taking so much space on your drives
alias diskspace="du -S | sort -n -r | less"

# where should we look when we do a relative path? 
# with this, it doesn't just have to be the current directory.
export CDPATH=".:~:/usr:/home/le"

# Easy way to extract archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1;;
           *.tar.gz)    tar xvzf $1;;
           *.bz2)       bunzip2 $1 ;;
           *.rar)       unrar x $1 ;;
           *.gz)        gunzip $1  ;;
           *.tar)       tar xvf $1 ;;
           *.tbz2)      tar xvjf $1;;
           *.tgz)       tar xvzf $1;;
           *.zip)       unzip $1   ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1;;
           *) echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}


# Move 'up' so many directories instead of using several cd ../../, etc.
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

#Another variation of the one above
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# Common variations of 'ls' command
alias lo="ls -o --color=always"
alias la="ls -la --color=always"
alias sl="ls --color=always"
alias ll='ls -aFGlhtu --color=always'
alias lls='ls -FGlhtu --color=always'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..ll='cd .. && ll'
alias ascii='man ascii'
alias c='clear'
alias edit_profile='vim ~/.bash_profile'
#alias reload_profile='source ~/.bash_profile'

# Navigation
alias home='cd ~'
alias dev='cd ~/Developer'
alias proj='cd ~/Projects'
alias rm='rm -i'
alias cp='cp -i'
alias desktop='cd ~/Desktop'
alias onedrive='cd ~/OneDrive'


# Dev
alias proc='ps -eo pid,user,uid,group,gid,vsz,rss,comm | less'
alias python_procs='ps aux | grep python'

#List people in a Twitch channel chat
function twitch_list() { curl -s "https://tmi.twitch.tv/group/user/$1/chatters" | less; }

#Nano for writing and spell-checking
function spellcheck() { aspell -c "$1"; }
function spell() { echo "$1" | aspell -a; }
alias nano="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
alias writer="nano -m -u -c -W -l --tabsize=4 --fill=85 --autoindent --smooth"

# Print a word from a certain column of the output when piping.
# Example: cat /path/to/file.txt | fawk 2 --> Print every 2nd word in each line.
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

#Tail all logs in /var/log
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Colors for All grep commands such as grep, egrep and zgrep

# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

### directory navigation thing. 
# 'cd' to the most recently modified directory in $PWD
#cl() {
#    last_dir="$(ls -Frt | grep '/$' | tail -n1)"
#    if [ -d "$last_dir" ]; then
#    cd "$last_dir"
#    fi
#}

# Directory bookmarking (one at a time)
###rd(){
###    pwd > "$HOME/.lastdir_$1"
###}

###crd(){
###    lastdir="$(cat "$HOME/.lastdir_$1")">/dev/null 2>&1
###    if [ -d "$lastdir" ]; then
###        cd "$lastdir"
###    else
###        echo "no existing directory stored in buffer $1">&2
###    fi
###}
### /directory navigation thing. 

# 'cd' into a directory and then list contents
cdls() { cd "$1"; ls;}

#For when you've spent too much time in DOS
alias cls="clear"
alias dir="ls"
alias deltree="rm -r"
alias rmdir="rm -r"
alias rd="rm -r"
alias rename="mv"
alias cd..="cd .."
alias chdir="pwd"
alias cmd="bash"
alias edit="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
alias erase="rm"
alias del="rm"
alias delete="rm"
alias expand="extract"
diskcopy(){ dd if=$1 of=$2; }
alias tasklist="htop"
alias tracert="traceroute"

#Generate a random strong password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#List by file size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"):    $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';} 

#Show active ports
alias port='netstat -tulanp'

#Rough function to display the number of unread emails in your gmail: gmail [user name]
gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'; }

#Use this for when the boss comes around to look busy.
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'| awk '{if (system(\"sleep .5 && exit 2\") != 2) exit; print}'"

#Print last value returned from previous command
lastvalue='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'

#Translator; requires Internet
#Usage: translate <phrase> <output-language> 
#Example: translate "Bonjour! Ca va?" en 
#See this for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
function translate(){ wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}'; }

###########################################

function weather() { echo ""; w3m http://www.usairnet.com/weather/forecast/local/?pands=$1 | grep -A 10 "${2^^}"; echo ""; curl -s http://wttr.in/$2; }


alias vi=`which vim`
alias rebash=". ~/.bashrc"
