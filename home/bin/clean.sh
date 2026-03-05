cd ~/dev || exit

sources=$(fd cargo.toml)

for src in $sources; do
    pushd "$(dirname "$src")" 1>/dev/null || continue
    pwd
    cargo clean
    popd 1>/dev/null
done
