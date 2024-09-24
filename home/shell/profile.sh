:q() {
    tmux kill-pane
}

:darwin() {
    darwin-rebuild switch --flake ~/dotfiles
}

:query() {
    fd "$@" /nix/store
}

:eval() {
    nix-instantiate --eval "$@"
}

:evalj() {
    nix-instantiate --eval --strict --json "$@"
}

:iflake() {
    nix repl --expr "builtins.getFlake \"$PWD\""
}

raspi() {
    TERM=xterm-256color ssh raspi
}

path.split() {
    echo "$PATH" | sed 's/:/\n/g' | sort | uniq -c
}

glog() {
    git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative "$@"
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
