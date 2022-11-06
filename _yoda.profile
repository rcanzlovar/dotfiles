
alias vi=vim

export PROMPT_COMMAND=
alias rgm="qdbus org.kde.Shutdown /Shutdown org.kde.Shutdown.logout"

alias SRM='zenity --question --width 450 --title "Close Steam/Steam Input?" --text "Exit Steam to launch Steam Rom Manager? Desktop controls will temporarily revert to touch/trackpad/L2/R2" && (kill -15 $(pidof steam) & /home/deck/Emulation/tools/srm/Steam-ROM-Manager.AppImage)'

