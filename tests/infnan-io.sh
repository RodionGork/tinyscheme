#!/bin/bash
out=$(./scheme -c '(display (list (- 0 +inf.0) (- 0 -inf.0) (+ -nan.0 0)))')
if [[ "$out" != "(-inf.0 +inf.0 +nan.0)" ]] ; then
  exit 1
fi
