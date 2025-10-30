export PATH=$PATH:/Applications/Alacritty.app/Contents/MacOS
export PATH=$PATH:/Applications/Ghostty.app/Contents/MacOS

export ZSH="/Users/asirago/.oh-my-zsh/"

plugins=(
  git
  zsh-autosuggestions
  )

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --bind=tab:toggle-down,btab:toggle-up'

export STARSHIP_CONFIG=~/.config/starship/starship.toml

[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

alias ls="lsd"
alias ll="ls -1"
alias l="ls -la"   
alias ld="ls -ld */"
alias la="ls -a"
alias lt="ls --tree --depth 2"
alias lt3="ls --tree --depth 3"
alias lt4="ls --tree --depth 4"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cd="z"

alias vi="nvim"
alias vim="nvim"
alias Vim="nvim"

alias vimcfg="cd ~/.config/nvim && nvim ."
alias gs="git status"

alias cleanupds="find . -type f -name '*.DS_Store' -ls -delete"

bindkey -s '^O' '~/.config/ghostty/ghostty.sh\n' > /dev/null 

# fh - search in your command history and execute selected command
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

function tatt() { tmux attach -t $1 }
function tnew() { tmux new -s $1 }
function tkill() { tmux kill-session -t $1 }
function mkcd() { mkdir -p $1 && cd $1 }
function replacePrefix() { 
  local prefix="$1"
  find . -maxdepth 1 -type f -name "${prefix}*" -exec sh -c 'mv "$0" "${0/${1}/}"' {} "$prefix" \; 
}

function list_env() {
  printenv | fzf --preview 'echo {} | awk -F "=" '\''{print $2}'\'
}

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/Users/adamsiraj/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#
export PATH="$PATH:$(go env GOPATH)/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
