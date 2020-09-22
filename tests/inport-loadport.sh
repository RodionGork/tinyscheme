#!/bin/bash
name="inport-loadport"
out=$(echo 1234 | ./scheme -c '(display (read))')
if [[ "$out" == "1234" ]] ; then
  echo "$name - ok"
else
  echo "$name - fail"
fi
