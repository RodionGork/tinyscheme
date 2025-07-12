(define (rfn n res)
    (if (= n 1) res (rfn (- n 1) (+ res n))))

(display (rfn 1000000 0))
