:q() {
    tmux kill-pane
}

:darwin() {
    darwin-rebuild switch --flake ~/dotfiles/.#
}

:query() {
    fd "$@" /nix/store
}

:eval() {
    nix-instantiate --eval "$@"
}

ide() {
    tmux split-window -v -l 20%
    tmux split-window -h -l 50%
    tmux select-pane -l
}

raspi() {
    TERM=xterm-256color ssh raspi
}

path.split() {
    echo "$PATH" | sed 's/:/\n/g' | sort | uniq -c
}

gst() {
    git status -sb
}

glog() {
    git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative "$@"
}

gcm() {
    git add .
    git commit -m "$1"
}

gcz() {
    git add .
    git cz
}

gP() {
    # Too dangerous
    # git add .
    # git commit -m "$1"
    git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
}

nman() {
    man "$@" | nvim +Man!
}

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
