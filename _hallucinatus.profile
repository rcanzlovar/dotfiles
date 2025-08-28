
alias gchrome='/usr/bin/google-chrome-stable >/dev/null 2>/dev/null &'
#alias qF='/home/rca/Downloads/flipper/qFlipper-x86_64-1.1.0.AppImage'
#alias discord='/usr/share/discord/Discord > /var/log/discord-${date +%Ymdhm}'
alias qflipper='/home/rca/qFlipper-x86_64-1.1.1.AppImage > /var/log/qflipper/qflipper-"$(date +%Y%m%d%h%M%s)".txt 2>&1 &'
alias discord='/usr/share/discord/Discord > /var/log/discord//discord-"$(date +%Y%m%d%h%M%s)".txt 2>&1 &'
##alias scp-gator3290="scp -p '2222' -o 'HostKeyAlgorithms=ssh-rsa'  "
alias scp-gator3290='scp -P 2222 -o HostKeyAlgorithms=ssh-rsa'

alias ssh-gator3290="ssh -p '2222' -o 'HostKeyAlgorithms=ssh-rsa'  gator3290"


#'nano /home/user/journals/"$(date +%Y)"/"$(date +%F-%H%M).txt"'





function pnote() {
echo "$(date -I) : $@" >> file.txt
tail -n 1 file.txt

}


