#!/bin/bash
out=$(echo "Ю" |./scheme -c '(display (read-char))')
if [[ "$out" != "Ю" ]] ; then
  exit 1
fi
