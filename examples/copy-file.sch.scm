#!../scheme -1

; copies file bytewise, e.g. "./copy-file.sch source.txt output.txt"
; not very fast - 5 seconds for 1Mb at 3GHz machine of 2020

(define src (car *args*))
(define dst (cadr *args*))

(display (string-append "Copying " src " -> " dst))
(newline)

(define src-f (open-input-file src))
(define dst-f (open-output-file dst))

(let loop ((c (read-u8 src-f)))
    (if (eof-object? c)
      #t
      (begin (write-u8 c dst-f) (loop (read-u8 src-f)))))

(close-input-port src-f)
(close-output-port dst-f)

(display "Done!")
(newline)
