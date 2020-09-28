#!/bin/bash
out=$(./scheme -c '(display (list (atom->string 15 3) (atom->string 27 16) (atom->string -30 8)))')
if [[ "$out" != '(120 1B -36)' ]] ; then
  exit 1
fi
out=$(./scheme -c '(display (list (string->atom "101" 3) (string->atom "101" 20) (string->atom "-1B" 16)))')
if [[ "$out" != '(10 401 -27)' ]] ; then
  exit 1
fi
