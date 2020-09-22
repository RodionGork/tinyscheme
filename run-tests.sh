#!/bin/bash
total=0
passed=0
for testfile in tests/*.sh ; do
  res=$(source "$testfile")
  echo $res
  if [[ "$res" == *ok ]] ; then
    passed=$((passed+1))
  fi
  total=$((total+1))
done

echo "Passed $passed of $total."
if [[ $passed -ne $total ]] ; then
  exit 1
fi
