#!/bin/bash
text=$(cat << STOP
line 1
line 2
STOP
)

out=$(./scheme -c '(display (read-line))' <<< "$text")
if [[ "$out" != "line 1" ]] ; then
  exit 1
fi

out=$(./scheme -c '(define p (open-input-file "run-tests.sh"))(display (read-line p))')
if [[ "$out" != "#!/bin/bash" ]] ; then
  echo $out
  exit 1
fi
