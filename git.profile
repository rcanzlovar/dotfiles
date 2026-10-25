
function gitcon {

  git config --global user.email "rcanzlovar@gmail.com"
  git config --global user.name "Bob Anzlovar"
}



# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'


# How to get rid of things that accidentally got into the git repo
## git rm -r --cached discord/Cache
# shortcuts from https://softwaredoug.com/blog/2022/11/09/idiot-proof-git-aliases.html
# these are aliases to git commands so 'git mainbranch' shows the branch you're on (master, etc)
# git update or git synced repulls from teh repo and rebases
### [alias]
  # *********************
  # Rebase workflow
###     mainbranch="!git remote show origin | sed -n '/HEAD branch/s/.*: //p'"
###     synced="!git pull origin $(git mainbranch) --rebase"
###     update="!git pull origin $(git rev-parse --abbrev-ref HEAD) --rebase"
###     squash="!git rebase -v -i $(git mainbranch)"
###     publish=push origin HEAD --force-with-lease
###     pub=publish 
   
