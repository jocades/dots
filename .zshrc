# p10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=nvim
[ -n "$TMUX" ] && export TERM=wezterm

export PATH=$HOME/.local/bin:$PATH # local scripts, bins..
export PATH=$HOME/.local/share/nvim/mason/bin:$PATH # language servers, formatters, etc
export PATH=~/go/bin:$PATH # go binaries `go install <pkg>`

# Plugins
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# just annoying
export HOMEBREW_AUTO_UPDATE_SECS=604800 # once a week

# Modern autocomplete
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" # case insensitive completion if no match

bindkey -e

# Aliases
alias cat="bat"
alias l="lsd --group-dirs first"
alias ls="lsd --group-dirs first"
alias ll="lsd -l --group-dirs first"
alias la="lsd -a --group-dirs first"
alias lla="lsd -la --group-dirs first"
alias grep="rg"
alias cl="clear"

alias g='git'
alias lg="lazygit"
alias v="nvim"
alias vim="nvim"
alias py="python3"
alias pip="pip3"
alias bpy="bpython"
alias code="code-insiders"

alias shconf="nvim ~/.zshrc"
alias vconf="cd ~/.config/nvim; nvim"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# One shot
function glog() {
  git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative "$@"
}

function gst() {
  git status -sb
}

function gcm() {
  git add .
  git commit -m "$1"
}


function gcz() {
  git add .
  git cz
}


function gP() {
  # Too dangerous
  # git add .
  # git commit -m "$1"
  git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
}

function raspi() {
  TERM=xterm-256color ssh raspi
}

# fuck https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide (z replacement)
eval "$(zoxide init zsh)"

# atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# yazi file eplorer (follow cwd)
function e() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bun completions
[ -s "/Users/j0rdi/.bun/_bun" ] && source "/Users/j0rdi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pg
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# # Nix
# if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
#   . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# fi
# # End Nix

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
