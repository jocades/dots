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
# source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme

# just annoying
export HOMEBREW_AUTO_UPDATE_SECS=604800 # once a week

# Modern autocomplete
autoload -Uz compinit && compinit
zstyle ":completion:*" matcher-list "" "m:{a-zA-Z}={A-Za-z}" # case insensitive completion if no match

# Some nice tohaves
bindkey -e
# source ~/dotfiles/home/shell/profile.sh

# alias code="code-insiders"
#
# # dirs
# alias ..="cd .."
# alias ...="cd ../.."
# alias ....="cd ../../.."
# alias .....="cd ../../../.."
# alias ......="cd ../../../../.."

# fuck https://github.com/nvbn/thefuck
eval $(thefuck --alias)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# zoxide (z replacement)
eval "$(zoxide init zsh)"

# atuin
. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "/Users/j0rdi/.bun/_bun" ] && source "/Users/j0rdi/.bun/_bun"

# pg
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

