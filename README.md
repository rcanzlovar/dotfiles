# dotfiles
My version of local files that make my environment mine. 

I've stolen a system whereby you can break your startup files into modules 
located in ~/.d (like the system startup files) then run them from the .bashrc using the 
the following code:
'''
# Load from .d.
# These lines should be appended to your .bashrc
if [[ -d ~/.d ]]; then
  for profile in $HOME/.d/*.profile; do
    source $profile
  done
  unset profile;
fi

'''

