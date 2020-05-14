# Python related things

# run the first command on edgar, run the other one on the 
# local machine connecting to edgar

#edgar port 8891 
#huey port 8892
alias jupystartedgar="cd ~/Projects/;jupyter notebook --no-browser --port=8891 &"
alias jupystarthuey="cd ~/Projects/;jupyter notebook --no-browser --port=8892 &"
alias jupyhuey=" ssh -N -f -L localhost:8892:localhost:8892 huey"
alias jupyedgar=" ssh -N -f -L localhost:8891:localhost:8891 edgar"

