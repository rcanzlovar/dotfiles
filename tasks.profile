
###########################################
#Task List
if [[ $TERM != "" ]]
then

TASKFILE="$HOME/.bashtask" #Hidden for neatness
NC='\033[0m' # No Color
LIGHTRED='\e[1;31m'
LIGHTBLUE='\e[1;34m'
if [ -f "$TASKFILE" ] && [ $(stat -c %s "$TASKFILE") != 0 ] #Check if file has content
then
    echo -e "${LIGHTRED}Task List${NC} as of ${LIGHTBLUE}$(date -r "$TASKFILE")${NC}"
    echo ""
    cat "$TASKFILE"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
else
    echo "Yay! No tasks :)"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
    touch "$TASKFILE"
fi
alias tasklist="bash"
function taskadd() { echo "- $1" >> "$TASKFILE"; } #Example: taskadd "Go grocery shopping"
function taskin() { sed -i "$1i- $2" "$TASKFILE"; } #Insert a task between items
function taskrm() { sed -i "$1d" "$TASKFILE"; } #Example: taskrm 2 --> Removes second item in list
function taskcl() { rm "$TASKFILE"; touch "$TASKFILE"; } #Delete and create a new taskfile

fi
