
# >>> conda initialize >>>
export PATH="/home/rcanzlovar/anaconda3/bin/:$PATH"
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rcanzlovar/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rcanzlovar/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rcanzlovar/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rcanzlovar/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

