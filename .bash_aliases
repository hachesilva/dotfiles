# Add colors to man
man() {
    env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

## Universal aliases
alias ls="ls -FGv --color=auto --time-style=long-iso"  # F: Mark folders, G: No group info, v: Natural order
alias ll="ls -la"
alias l="ls -1"

## Prompt for file name if no second parameter is present when using mv
## Source: https://gist.github.com/premek/6e70446cfc913d3c929d7cdbfe896fef
function mv() {
  if [ "$#" -ne 1 ] || [ ! -e "$1" ]; then
    command mv "$@"
    return
  fi

  read -ei "$1" newfilename
  command mv -v -- "$1" "$newfilename"
}

## Copy and paste from command line
if [[ $(uname) = 'Linux' ]]; then
    alias pbcopy='xclip -selection clipboard' # Use xclip on linux, pbcopy on Mac
    alias pbpaste='xclip -selection clipboard -o' # Use xclip on linux, pbcopy on Mac
fi

## Directory aliases
alias pw='pwd; pwd | pbcopy' # Always copy path to clipboard when executing pwd
alias mk='mkdir -p' # Create directory even if parents don't exist
function mkd () { mkdir -p "$@" && cd "$@"; } # Create directory and cd into it

alias ydl='youtube-dl'
alias ydlm='youtube-dl -x --audio-format mp3 --audio-quality 320K'

alias untar='tar xvf'
alias h='history'

## Git aliases
function gbcp () { git branch | grep "*" | awk '{ print $2 }' | pbcopy } # Copy current branch name

alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gb="git branch"
alias gbD="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcod="git checkout develop"
alias gcom="git checkout master"
alias gd="git diff"
alias gdb="git diff --name-status" # See current branch's changed files against other branch. expects BRANCHNAME as parameter
alias gdc="git diff --cached"
alias gf="git fetch"
alias gi="git init"
alias gm="git merge"
alias gpl="git pull"
alias gps="git push"
alias grm="git rm"
alias gs="git status"
alias gst="git stash"
alias gsta="git stash apply"
alias gstl="git stash list"
alias gundo="git reset --soft HEAD~1" # Undo last commit

## Extras
alias killzombie="kill $(ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}')"
alias zombie="ps aux | grep Z"
alias parentp="ps -o ppid= -p" ## Parameter would be process id

## OS app install/remove
alias install="sudo apt-get install"
alias remove="sudo apt-get remove --purge"

