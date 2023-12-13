# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path
export EDITOR='nvim'
export VISUAL='nvim'
export TERM='xterm-256color'
export PYENV_ROOT="$HOME/.pyenv"

# Shell scripts
export PATH=$HOME/.local/bin:$PATH

# Plugins
source $HOMEBREW_PREFIX/etc/profile.d/z.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/opt/powerlevel10k/powerlevel10k.zsh-theme

# Modern autocomplete
autoload -Uz compinit
compinit

# Aliases
alias cat='bat'
alias l='lsd --group-dirs first'
alias ls='lsd --group-dirs first'
alias ll='lsd -l --group-dirs first'
alias la='lsd -a --group-dirs first'
alias lla='lsd -la --group-dirs first'
alias grep='grep --color=auto'


alias g='git'
alias lg='lazygit'
alias v='nvim'
alias vim='nvim'
alias e='ranger'
alias py='python3'
alias pip='pip3'
alias bpy='bpython'
alias nr='npm run'
alias pnr='pnpm run'
alias code='code-insiders'

alias shconf='nvim $HOME/.zshrc'
alias vconf='cd $HOME/.config/nvim; nvim'

# Functions
function glog() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative "$@"
}

function gcm() {
  git add .
  git commit -m "$1"
}

function gcmp() {
  git add .
  git commit -m "$1"
  git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
}

function nimc() {
  nim c -r --verbosity:0 "$1"
}

# beautify man pages
function man() {
  env \
  LESS_TERMCAP_mb=$'\e[01;31m' \
  LESS_TERMCAP_md=$'\e[01;31m' \
  LESS_TERMCAP_me=$'\e[0m' \
  LESS_TERMCAP_se=$'\e[0m' \
  LESS_TERMCAP_so=$'\e[01;44;33m' \
  LESS_TERMCAP_ue=$'\e[0m' \
  LESS_TERMCAP_us=$'\e[01;32m' \
  man "$@"
}


[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bun completions
[ -s "/Users/j0rdi/.bun/_bun" ] && source "/Users/j0rdi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pg
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# pyenv
eval "$(pyenv init -)"
export PATH="/opt/homebrew/Cellar/pyenv-virtualenv/1.2.1/shims:${PATH}";
export PYENV_VIRTUALENV_INIT=1;
_pyenv_virtualenv_hook() {
  local ret=$?
  if [ -n "${VIRTUAL_ENV-}" ]; then
    eval "$(pyenv sh-activate --quiet || pyenv sh-deactivate --quiet || true)" || true
  else
    eval "$(pyenv sh-activate --quiet || true)" || true
  fi
  return $ret
};
typeset -g -a precmd_functions
if [[ -z $precmd_functions[(r)_pyenv_virtualenv_hook] ]]; then
  precmd_functions=(_pyenv_virtualenv_hook $precmd_functions);
fi

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
