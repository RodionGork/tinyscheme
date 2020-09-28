#!/bin/bash
out=$(./scheme -c '(display (list (truncate 1.7) (truncate -2.8) (truncate 0) (truncate +inf.0) (truncate -inf.0) (truncate +nan.0)))')
if [[ "$out" != "(1.0 -2.0 0.0 +inf.0 -inf.0 +nan.0)" ]] ; then
  exit 1
fi
