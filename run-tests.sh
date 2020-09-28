#!/bin/bash

text_test() {
  eof=0
  oddeven=1
  while [[ $eof -eq 0 ]] ; do
    read -r str
    eof=$?
    if [[ "$str" == "" ]] ; then
      continue
    fi
    pref=${str:0:1}
    if [[ "$pref" == ";" ]] ; then
      continue
    fi
    if [[ $oddeven -eq 1 ]] ; then
      quest=$str
    else
      tested=$((tested + 1))
      if [[ "${quest:0:6}" != "(write" ]] ; then
        ans=$(./scheme -c "(display $quest)")
      else
        ans=$(./scheme -c "$quest")
      fi
      if [[ "$ans" != "$str" ]] ; then
        echo "  Q: $quest"
        echo "  A: $ans"
        echo "  X: $str"
        failed=$((failed + 1))
      fi
    fi
    oddeven=$((1 - oddeven))
  done < $testfile
}

shell_test() {
  output=$(source $testfile)
  if [[ $? -ne 0 ]] ; then
    echo $output
    failed=$((failed + 1))
  fi
  tested=$((tested + 1))
}

total=0
passed=0

for testfile in tests/* ; do
  failed=0
  tested=0
  echo $testfile:
  if [[ $testfile = *.txt ]] ; then
    text_test
  elif [[ $testfile = *.sh ]] ; then
    shell_test
  else
    echo "  [SKIP]"
    continue
  fi
  if [[ $failed -eq 0 ]] ; then
    outcome=" OK "
    passed=$((passed+1))
  else
    outcome="FAIL"
  fi
  echo "  [$outcome]" - $((tested - failed))/$tested
  total=$((total+1))
done

echo "Passed $passed of $total."
if [[ $passed -ne $total ]] ; then
  exit 1
fi
