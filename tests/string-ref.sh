#!/bin/bash
out=$(./scheme -c '(display (string-ref "bla" 1))')
if [[ "$out" != "l" ]] ; then
  exit 1
fi

