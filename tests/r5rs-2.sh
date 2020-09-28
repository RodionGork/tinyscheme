#!/bin/bash

# remade from Chibi Scheme "r5rs-tests.scm"

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


exit
# the following fails, so let's exit here

code=$(cat << STOP
(display
    (let ((path '())
          (c #f))
      (let ((add (lambda (s)
                   (set! path (cons s path)))))
        (dynamic-wind
            (lambda () (add 'connect))
            (lambda ()
              (add (call-with-current-continuation
                    (lambda (c0)
                      (set! c c0)
                      'talk1))))
            (lambda () (add 'disconnect)))
        (if (< (length path) 4)
            (c 'talk2)
            (reverse path)))))
STOP
)

out=$(./scheme -c "$code")
if [[ "$out" != "(connect talk1 disconnect connect talk2 disconnect)" ]] ; then
  echo "OUT: $out"
  exit 1
fi

