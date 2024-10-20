# Starship
eval "$(starship init zsh)"

# Functions

function laws() {
  echo -e "$BLUE==> Running: aws sso login --profile $1 $NC"
  aws sso login --profile $1
}

function greetings() {
  figlet -f slant s9tpepper | lolcat
}

function neat() {
  yq eval 'del(.items[].metadata.managedFields,
    .metadata.annotations,
    .metadata.creationTimestamp,
    .metadata.generation,
    .metadata.managedFields,
    .metadata.manager,
    .metadata.operation,
    .metadata.time,
    .metadata.apiVersion,
    .metadata.fieldsType,
    .metadata.fieldsV1,
    .metadata.resourceVersion,
    .metadata.uid,
    .metadata.selfLink,
    .status,
    .items[].spec.clusterIP,
    .items[].spec.clusterIPs,
    .items[].metadata.annotations,
    .items[].metadata.creationTimestamp,
    .items[].metadata.generation,
    .items[].metadata.managedFields,
    .items[].metadata.manager,
    .items[].metadata.operation,
    .items[].metadata.time,
    .items[].metadata.apiVersion,
    .items[].metadata.fieldsType,
    .items[].metadata.fieldsV1,
    .items[].metadata.resourceVersion,
    .items[].metadata.uid,
    .items[].status,
    .items[].metadata.selfLink,
    .items[].metadata.uid,
    .items[].metadata.creationTimestamp,
    .items[].metadata.ownerReferences)'
}


# THIS FIXES ERROR SWITCHING INTO NORMAL MODE IN ZSH
# Check that the function `starship_zle-keymap-select()` is defined.
# xref: https://github.com/starship/starship/issues/3418
# type starship_zle-keymap-select >/dev/null || \
#   {
#     eval "$(starship init zsh)"
#   }

# Tools Init
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
eval "$(thefuck --alias)"
eval "$(atuin init zsh)"

## Use fd for fzf instead of find command
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \$' {}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                    "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Use fd for listing path candidate
# - $1 is the base path where the path listings start getting traversed
# - See the source code (completion.zsh) for details
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# fzf git integration
source ~/fzf-git.sh/fzf-git.sh


# aliases
alias cat="bat"
alias cd="z"
alias ls="eza"
alias k='kubectl'
alias k8ns='kubens'
alias kprod='kubectl config use-context worldofgoodbrands-prod-eks'
alias kdev='kubectl config use-context worldofgoodbrands-dev-eks'
alias token='echo "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU4MmI3YzI5MWU0NTQ3MDAxMTcyMDg5ZiIsImVtYWlsIjoiZGV2c0BsZWFmZ3JvdXAuY29tIiwicm9sZXMiOlsidXNlciIsImFkbWluIl0sImxvZ2luVG9rZW4iOiI1MzA2NTgxYy0yMjAyLTQ2YWYtYTM1NC05NzIxNzM4ODE0OTciLCJpYXQiOjE0NzkyNDU2MjUsImV4cCI6NDYzMjg0NTYyNX0.etR44SEv2A3vI3vO6HnSBXruwPMWMTIE8-ZR8vom6e4" | pbcopy; echo "token copied."'


greetings


# enable vim bindings
bindkey -v

# Autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh








export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
