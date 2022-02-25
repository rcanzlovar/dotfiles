# dotfiles

My version of local files that make my environment mine. This kinda mimics how the ```/etc/init.d``` files. In essence, if you include the code at the bottom of this page (also contained in ```bashrc_addendum```) somewhwere probably at the end which selects and runs as bash code any files that end in .profile i.e. git.profile. There is one excepton: If the name starts with '_' i.e. ```_myhostname``` then these things only get executed if the name of this host is ```myhostname```.

I've stolen a system whereby you can break your startup files into modules 
located in ```~/.d``` (like the system startup files) then run them from the ```.bashrc``` using the 
the following code:
```
if [[ -d ~/.d ]]; then
  for profile in $HOME/.d/*.profile; do
    source $profile
  done
  unset profile;
fi

```

