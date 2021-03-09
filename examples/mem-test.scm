#!../scheme -1

; grows list of integers until memory is exhausted
; it happens when list is about CELL_SEGSIZE * CELL_NSEGMENT / 2 long
; for speed it is better to increase CELL_SEGSIZE than CELL_NSEGMENT


(let loop ((i 1) (acc '()))
    (if (zero? (modulo i 1000)) (begin (display i) (newline)))
    (loop (+ 1 i) (cons i acc)))
