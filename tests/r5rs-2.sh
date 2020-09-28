#!/bin/bash
out=$(./scheme -c '(define let*-def 1) (let* () (define let*-def 2) #f) (display let*-def)')
if [[ "$out" != "1" ]] ; then
  exit 1
fi

code=$(cat << STOP
(display
    (let loop ((numbers '(3 -2 1 6 -5)) (nonneg '()) (neg '()))
      (cond
       ((null? numbers)
        (list nonneg neg))
       ((>= (car numbers) 0)
        (loop (cdr numbers) (cons (car numbers) nonneg) neg))
       ((< (car numbers) 0)
        (loop (cdr numbers) nonneg (cons (car numbers) neg))))))
STOP
)
out=$(./scheme -c "$code")
if [[ "$out" != "((6 1 3) (-5 -2))" ]] ; then
  echo "OUT: $out"
  exit 1
fi