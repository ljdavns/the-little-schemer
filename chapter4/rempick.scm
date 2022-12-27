(define sub1
  (lambda (n) (- n 1)))

(define rempick
  (lambda (n lat)
    (cond
      ((null? lat) '())
      ((zero? (sub1 n)) (cdr lat))
      (else 
        (cons (car lat) (rempick (sub1 n) (cdr lat)))
      )
    )
  )
)

(print 
  (rempick 9 '(1 2 3))
)

(print 
  (rempick 2 '(1 2 3))
)

(print 
  (rempick 3 '(a b c d e))
)
