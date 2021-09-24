#  https://askubuntu.com/questions/466198/how-do-i-change-the-color-for-directories-with-ls-in-the-console
#Blue = 34
#Green = 32
#.Light Green = 1;32
#Cyan = 36
#Red = 31
#Purple = 35
#Brown = 33
#Yellow = 1;33
#Bold White = 1;37
#Light Grey = 0;37
#Black = 30
#Dark Grey= 1;30

#LS_COLORS=$LS_COLORS:'di=1;33:ln=36' ; export LS_COLORS;
COLORFILE=/home/rca/.local/share/lscolors.sh
if [[ -f $COLORFILE ]]; then
   . $COLORFILE
fi
