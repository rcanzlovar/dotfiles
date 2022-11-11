
function gitcon {

  git config --global user.email "rcanzlovar@gmail.com"
  git config --global user.name "Bob Anzlovar"
}

# shortcuts from https://softwaredoug.com/blog/2022/11/09/idiot-proof-git-aliases.html
# these are aliases to git commands so 'git mainbranch' shows the branch you're on (master, etc)
# git update or git synced repulls from teh repo and rebases
[alias]
  # *********************
  # Rebase workflow
    mainbranch = "!git remote show origin | sed -n '/HEAD branch/s/.*: //p'"
    synced = "!git pull origin $(git mainbranch) --rebase"
    update = "!git pull origin $(git rev-parse --abbrev-ref HEAD) --rebase"
    squash = "!git rebase -v -i $(git mainbranch)"
    publish = push origin HEAD --force-with-lease
    pub = publish 
   
