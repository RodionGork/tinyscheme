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
#xFFFFFFFF #xE6070001 #xE0E30C61 #xF1F11C38 #xF3F1BE3C #xF3F1BE3E #xF3E1FE1F
#xFFC1FF1F #xFF83FF1F #xFF07FF1F #xFE0FFF0F #xFC1F7F8F #xFC3F7F8F
#xFC7E7F87 #xFC7E7FC7 #xFC7C3FC7 #xFE383FC3 #xFF833F00 #xFFFFFFFF))
