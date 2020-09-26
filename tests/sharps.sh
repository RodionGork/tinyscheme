#!/bin/bash
out=$(./scheme -c "(display '(#t #f #\T #\space #\x41))")
if [[ "$out" != '(#t #f T   A)' ]] ; then
  echo Got: $out
  exit 1
fi
