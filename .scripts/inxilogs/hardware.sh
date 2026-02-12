#!/usr/bin/env bash

set -euo pipefail

selected=$(cat ~/.scripts/inxilogs/inxi_args.txt | fzf --with-nth 1 | awk '{print $2}') 

if [[ -z $selected ]]; then
    exit 0
  fi

  read -p "Upload output ? (y/N): " send 

  case $send in 
    [Yy]* ) inxi "$selected" | eos-sendlog;;
    [Nn]* | * ) inxi "$selected";;
  esac
exit 0
