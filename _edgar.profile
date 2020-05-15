# things meant for the jetson nano 
alias jtop="sudo /usr/local/bin/jtop"
alias jfanfull="sudo sh -c 'echo 255 > /sys/devices/pwm-fan/target_pwm'"

alias livecam=" gst-launch-1.0 nvarguscamerasrc ! 'video/x-raw(memory:NVMM),width=3820, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw,width=960, height=616' ! nvvidconv ! nvegltransform ! nveglglessink -e"
