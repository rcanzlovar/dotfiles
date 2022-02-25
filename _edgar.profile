# things meant for the jetson nano 
alias jtop="sudo /usr/local/bin/jtop"
alias jfanfull="sudo sh -c 'echo 255 > /sys/devices/pwm-fan/target_pwm'"
alias jfanoff="sudo sh -c 'echo 0 > /sys/devices/pwm-fan/target_pwm'"
#root@edgar:/home/rca# echo 0 > /sys/devices/pwm-fan/target_pwm 
#root@edgar:/home/rca# 


alias livecam=" gst-launch-1.0 nvarguscamerasrc ! 'video/x-raw(memory:NVMM),width=3820, height=2464, framerate=21/1, format=NV12' ! nvvidconv flip-method=0 ! 'video/x-raw,width=960, height=616' ! nvvidconv ! nvegltransform ! nveglglessink -e"
# tensorflow related things

alias ,tfversion="python3 -c 'import tensorflow as tf; print(tf.__version__)'"
alias ,cvversion="python3 -c 'import cv2; print(cv2.__version__)'"
#python3 -c 'import tensorflow as tf; print(tf.__version__)'

# make jupyter available remotely
alias jupystart="cd ~/Projects/;jupyter notebook --no-browser --port=8891 &"
