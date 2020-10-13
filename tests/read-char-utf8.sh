#!/bin/bash
out=$(echo "Ю" |./scheme -c '(display (read-char))')
if [[ "$out" != "Ю" ]] ; then
  exit 1
fi
out=$(echo "Ю" |./scheme -c '(display (list (read-u8) (read-u8)))')
if [[ "$out" != "(208 174)" ]] ; then
  exit 1
fi
out=$(./scheme -c '(write-u8 208)(write-u8 174)')
if [[ "$out" != "Ю" ]] ; then
  exit 1
fi
