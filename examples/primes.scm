#!../scheme -1

(define (not-prime? x)
    (if (= 0 (modulo x 2))
        2
        (find-odd-div x 3)))

(define (find-odd-div x d)
    (cond
        ((< x (* d d)) #f)
        ((= 0 (modulo x d)) d)
        (else (find-odd-div x (+ d 2)))))

(display "Prime numbers above 1e9")
(newline)

(let loop ((x 1000000001))
    (if (eq? #f (not-prime? x))
        (begin (display x) (newline)))
    (if (> x 2000000000)
        (begin (display "done") (newline) #f)
        (loop (+ x 2))))


