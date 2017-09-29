export TERM="xterm-256color"

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$''
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator time)

## Universal aliases
alias ls="ls -FGv --color=auto --time-style=long-iso"  # F: Mark folders, G: No group info, v: Natural order
alias ll="ls -la"
alias l="ls -1"

if [[ $(uname) = 'Linux' ]]; then
    alias pbcopy='xclip -selection clipboard' # Use xclip on linux, pbcopy on Mac
    alias pbpaste='xclip -selection clipboard -o' # Use xclip on linux, pbcopy on Mac
fi

alias pwd='pwd; pwd|pbcopy' # Copy any path from pwd command to clipboard

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

## Add syntax highlighting to zsh. Must be last line
source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
