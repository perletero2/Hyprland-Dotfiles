#!/usr/bin/env bash

for i in /sys/class/hwmon/hwmon*; do
  echo "$i: $(cat $i/name)"
done
