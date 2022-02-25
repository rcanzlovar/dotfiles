# virtualenv and virtualenvwrapper
# run it if it exists, dont worry if it doesnt
# -export WORKON_HOME=$HOME/.virtualenvs

if [  -f /usr/bin/python3 ]
then
# virtualenv and virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
else
echo "no python3"
do_install=1
fi

if [  -f /usr/local/bin/virtualenvwrapper.sh ]
then
source /usr/local/bin/virtualenvwrapper.sh
else
#echo "no /usr/local/virtualenvwrapper.sh"
do_install=1
fi

if [ do_install == 1  ]
then
echo "you should install virtualenv and virtulenvwrapper"
#else
#echo "you're good to go"
fi

FILE=/usr/local/bin/virtualenvwrapper.sh

if test -f "$FILE"; then
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source /usr/local/bin/virtualenvwrapper.sh
fi
