#!/bin/bash
name="string-ref"
out=$(./scheme -c '(display (string-ref "bla" 1))')
if [[ "$out" == "l" ]] ; then
  echo "$name - ok"
else
  echo "$name - fail"
fi

