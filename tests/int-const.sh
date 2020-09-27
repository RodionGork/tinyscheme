#!/bin/bash
out=$(./scheme -c "(display '(#x15 #d15 #o15 #b11001))")
if [[ "$out" != '(21 15 13 25)' ]] ; then
  echo Got: $out
  exit 1
fi
