#!/bin/bash
out=$(echo 1234 | ./scheme -c '(display (read))')
if [[ "$out" != "1234" ]] ; then
  exit 1
fi
