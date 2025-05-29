
# set up common meld commands


alias dat='date +"%y%m%d-%H%M%S"'
alias e='emacs -nw'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias gl='git log --pretty="%C(Yellow)%h  %C(reset)%ad (%C(Green)%cr%C(reset))%x09 %C(Cyan)%an: %C(reset)%s" --date=short -1'
alias HIGHLANDER='ls -t | tail -n +2 | xargs rm -r'

alias ainvent='ansible-inventory --host'
alias allstate='~/bin/allstate.sh'
alias ansible="ansible --limit '!excluded'"
alias anvestat='~/bin/anvestat.sh'
alias ap='ansible-playbook'
alias aping="ansible -m ping"
alias apy='/usr/bin/python3'
alias cpus='cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor'


alias gsm='gnome-system-monitor'
alias jl="sed 'N;s/\n/ /'"
alias lal='ls -al'
alias la='ls -a'
alias lh='ls -lh'
alias l='ls -ltr'
alias longstockings='pip3 download --extra-index-url https://pypi.python.org/simple/ --trusted-host files.pythonhosted.org'
alias lth='ls -lth'
alias nvtmp='sudo smartctl -a /dev/nvme0n1 | grep Sensor'
alias pato='echo "$(pwd)/$(ls -tr | tail -n1)"'
alias pigs='timeout 30 du -ahL . --exclude=/{proc,sys,dev,run,mnt,home,etc,proj} --exclude="./.*" 2> /dev/null | sort -n -r | head -n 20'
alias pippi='sudo pip3 install --extra-index-url https://pypi.python.org/simple/ --trusted-host files.pythonhosted.org'
alias rds='~/code/weatherwax/scripts/run-diff-static-python-check.sh'
alias s-all='systemctl --type=service'
alias s-exited='systemctl --type=service --state=exited'
alias s-failed='systemctl --type=service --state=failed'
alias snid='sudo nvme id-ns /dev/nvme0n1'
alias s-running='systemctl --type=service --state=running'
alias sysall='systemctl --type=service'
alias sysrunning='systemctl --type=service --state=running'
alias ts='date +%Y-%m-%d_%H:%M:%S'
# User specific aliases and functions
