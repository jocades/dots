:q() {
    tmux kill-pane
}

# Nix
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

# Rust
cargot() {
    cargo test -q "$@" -- --nocapture
}

# Raspberry Pi
raspi() {
    TERM=xterm-256color ssh raspi
}

# Git
glog() {
    git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative "$@"
}

gP() {
    # Too dangerous
    # git add .
    # git commit -m "$1"
    git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)"
}

# Misc
nman() {
    "$@" | nvim +Man!
}

mkcd() {
    mkdir -p "$1" && cd "$1" || exit
}

path.split() {
    echo "$PATH" | sed 's/:/\n/g' | sort | uniq -c
}

path.push() {
    _path=$(realpath "$1")
    export PATH=$PATH:$_path
}

batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

cppcw() {
    watchexec -e cpp -r "clang++ -std=c++20 -O2 -Wall $*"

}
