:switch() {
    darwin-rebuild switch --flake ~/dotfiles/.# --impure
}

:store() {
    fd "$@" /nix/store
}

raspi() {
    TERM=xterm-256color ssh raspi
}

gst() {
    git status -sb
}

glog() {
    git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative "$@"
    # [alias]
    # lg1 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all
    # lg2 = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'
    # lg = lg1
    #
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

# yazi file eplorer (follow cwd)
e() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
