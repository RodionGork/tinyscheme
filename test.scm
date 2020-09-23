(define (read-str)
    (let loop ((acc '()))
        (let ((c (read-char)))
            (if (eqv? c #\newline)
                (list->string (reverse acc))
                (loop (cons c acc))))))

(display (read-str))
(newline)
