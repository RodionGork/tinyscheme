#!../scheme -1

(define *t0* (current-second))
(define *ec0* (eval-count))

; calculate von-Neumann random sequence
; storing it into list and checking for repeat
; repeats for values from 1234 to 9876
; showing current longest

(define (contains s v)
    (let loop ((s s))
        (if (null? s)
            #f
            (if (= v (car s))
                #t
                (loop (cdr s))))))

(define (neumann x)
    (let loop ((x x) (acc '()) (n 0))
        (if (contains acc x)
            n
            (loop (modulo (quotient (* x x) 100) 10000) (cons x acc) (+ 1 n)))))

(let loop ((x 1234)(best 0))
    (if (= x 9876)
        #t
        (let ((cur (neumann x)))
            (if (> cur best) (begin (display x) (display ": ") (display cur) (newline)))
            (loop (+ 1 x) (max cur best)))))


(let ((dt (- (current-second) *t0*)))
    (display "Evaluation time: ")
    (display dt)
    (newline)
    (display (round (/ (- (eval-count) *ec0*) dt)))
    (display " evals per second")
    (newline))
