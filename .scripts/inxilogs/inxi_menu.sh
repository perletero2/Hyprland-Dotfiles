#!/usr/bin/env bash

set -euo pipefail

# Separate arrays: names for display, args for inxi
names=(
  "Hardware/System"
  "Graphics"
  "Audio"
  "Drive/Disk"
  "Swap"
  "Partition"
  "Network"
  "Repo"
  "Motherboard"
)

args=(
  "-Fxxc0z"
  "-Gaz"
  "-Aaz"
  "-daz"
  "-aj"
  "-paz"
  "-Naz"
  "-r"
  "-Maz"
)

# Run fzf on just the names
selected_name=$(printf '%s\n' "${names[@]}" | fzf)

# Exit cleanly if nothing selected
if [[ -z $selected_name ]]; then
  exit 0
fi

# Get the index of the selected name and use the corresponding args
idx=$(printf '%s\n' "${names[@]}" | grep -nxF "$selected_name" | head -1 | cut -d: -f1)
selected_args="${args[$((idx-1))]}"

# Ask the user whether to upload the output
read -p "Upload output ? (y/N): " send

case $send in
  [Yy]* ) inxi "$selected_args" | eos-sendlog;;
  [Nn]* | * ) inxi "$selected_args";;
esac
