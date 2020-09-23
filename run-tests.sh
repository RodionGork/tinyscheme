#!/bin/bash
total=0
passed=0
for testfile in tests/*.sh ; do
  output=$(source "$testfile")
  res=$?
  if [[ $res -eq 0 ]] ; then
    outcome=" OK "
    passed=$((passed+1))
  else
    outcome="FAIL"
  fi
  echo [$outcome] - $testfile
  total=$((total+1))
done

echo "Passed $passed of $total."
if [[ $passed -ne $total ]] ; then
  exit 1
fi
