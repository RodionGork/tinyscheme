#!../scheme -1

(define (prnline x)
    (display "   ")
    (let loop ((v x))
        (if (= 0 (modulo v 2))
            (display "TS")
            (display "  "))
        (if (> v 1) (loop (quotient v 2)) #f))
    (newline))

(for-each prnline '(
#x7FFFFFFF #x66070001 #x60E30C61 #x71F11C38 #x73F1BE3C #x73F1BE3E #x73E1FE1F
#x7FC1FF1F #x7F83FF1F #x7F07FF1F #x7E0FFF0F #x7C1F7F8F #x7C3F7F8F
#x7C7E7F87 #x7C7E7FC7 #x7C7C3FC7 #x7E383FC3 #x7F833F00 #x7FFFFFFF))
