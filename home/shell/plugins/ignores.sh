#!/usr/bin/env bash

for cmd in curl jq fzf; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd is not installed. Please install it and try again."
        exit 1
    fi
done

ignores=$(curl -s "https://api.github.com/repos/github/gitignore/contents" |
    jq -r '.[] | select(.name | endswith(".gitignore")) | .name' | sort)

if [ -z "$ignores" ]; then
    echo "Failed to fetch .gitignore files from GitHub."
    exit 1
fi

selected=$(echo "$ignores" | fzf --prompt="Select a .gitignore file: ")

if [ -z "$selected" ]; then
    echo "No file selected. Exiting."
    exit 0
fi

if [ -f ".gitignore" ]; then
    read -rp "A .gitignore file already exists. Do you want to overwrite it? (y/N): " confirm
    if [[ ! $confirm =~ ^[Yy]$ ]]; then
        echo "Operation cancelled. Exiting."
        exit 0
    fi
fi

echo "Downloading $selected..."
curl -s "https://raw.githubusercontent.com/github/gitignore/main/$selected" >.gitignore

if [ $? -eq 0 ]; then
    echo "Created .gitignore in the current directory."
else
    echo "Failed to download $selected."
    exit 1
fi
