#!/bin/bash
out=$(./scheme -c '(display (/ 1 0)) (display (/ 0 0)) (display (/ -1 0))')
if [[ "$out" != "+inf.0+nan.0-inf.0" ]] ; then
  exit 1
fi
