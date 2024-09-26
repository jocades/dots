dots="$HOME/dotfiles"
logf="$dots"/switch.log

notify() {
    osascript -e "display notification \"$1\" with title \"Darwin Switch\""
}

pushd "$dots" || exit

if git diff --quiet "*.nix"; then
    echo "No changes detected, exiting..."
    popd || exit
    exit 0
fi

git diff -U0 "*.nix"

echo "Rebuilding darwin system..."

darwin-rebuild switch --flake "$dots" &>"$logf" || (
    rg error "$logf"
    exit 1
)

current=$(darwin-rebuild switch --list-generations | rg current)
gen=$(echo "$current" | awk '{print $1}')
hash=$(basename "$(readlink /run/current-system)") # includes date

git commit -am "auto:${gen}:${hash}" # squash before push

popd || exit

notify "System updated succesfully"
