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

if [[ $(uname) = 'Linux' ]]; then
    alias pbcopy='xclip -selection clipboard' # Use xclip on linux, pbcopy on Mac
    alias pbpaste='xclip -selection clipboard -o' # Use xclip on linux, pbcopy on Mac
fi

alias pw='pwd; pwd | pbcopy' # Copy any path from pwd command to clipboard
alias mk='mkdir -p'
function mkd () { mkdir -p "$@" && cd "$@"; }

alias ydl='youtube-dl'
alias ydlm='youtube-dl -x --audio-format mp3 --audio-quality 320K'

alias untar='tar xvf'
alias h='history'

## Git aliases
alias gga="git add"
alias ggs="git status"
alias ggd="git diff"
alias ggch="git checkout"
alias ggcm="git commit -m"
alias ggst="git status"
alias ggad="git add"
alias ggpu="git push"
alias gguncm="git reset --soft HEAD~1" # Undo last commit
alias ggdiffvsbranch="git diff --name-status" # See current branch's changed files against other branch. expects BRANCHNAME as parameter
function cpgb () { git branch | grep "*" | awk '{ print $2 }' | pbcopy } # Copy current branch name

## Extras
alias killzombie="kill $(ps -A -ostat,ppid | awk '/[zZ]/ && !a[$2]++ {print $2}')"
alias zombie="ps aux | grep Z"
alias parentp="ps -o ppid= -p" ## Parameter would be process id

## OS app install/remove
alias install="sudo apt-get install"
alias remove="sudo apt-get remove --purge"

