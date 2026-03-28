#!/usr/bin/env bash

     for hwmon in /sys/class/hwmon/hwmon*; do
       name=$(cat "$hwmon/name" 2>/dev/null)
       case "$name" in
           "k10temp"|"zenpower"|"coretemp")
               echo -e "\n\e[31m=== $hwmon ===\e[0m"
               echo "$(lscpu | grep "Model name")"
               ;;
           "amdgpu")
               device_link="$hwmon/device"
               if [[ -L "$device_link" ]]; then
                   target=$(readlink -f "$device_link")
                   echo -e "\n\e[31m=== $hwmon ===\e[0m"
                   pci_id=$(basename $(dirname "$target") | grep -o "0000:[0-9a-f]\+:[0-9a-f]\+\.[0-9a-f]")
                   if [[ -n "$pci_id" ]]; then
                       lspci -s "$pci_id" | cut -d ' ' -f 2-
                   fi
               fi
               ;;
           *)
               ;;
       esac
   done
