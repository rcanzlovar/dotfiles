
#alias mysite2="cd ~/Projects/django-projects/mysite; python3 manage.py runserver 0.0.0.0:8000 > /tmp/django-mysite-`date '+%s'`.log  & " 
alias mysiteshell="cd ~/Projects/django-projects/mysite; python3 manage.py shell " 
function mysite() {
    mydate=$(date '+%s')
    log1=/tmp/django-mysite-${mydate}stdout.log 
    log2=/tmp/django-mysite-${mydate}stderr.log 
    pushd ~/Projects/django-projects/mysite
	python3 manage.py runserver 0.0.0.0:8000  2> ${log2} > ${log1} & 
	tail -f ${log2}
	popd
}
function MSshell() {
	pushd ~/Projects/django-projects/mysite; 
	python3 manage.py shell
	popd
}
