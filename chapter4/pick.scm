(define sub1
  (lambda (n) (- n 1)))

(define pick
  (lambda (n lat)
    (cond
      ((null? lat) 'undefined)
      ((eq? (sub1 n) 0) (car lat))
      (else 
        (pick (sub1 n) (cdr lat))
      )
    )
  )
)

(print 
  (pick 9 '(1 2 3))
)

(print 
  (pick 2 '(1 2 3))
)

(print 
  (pick 3 '(a b c d e))
)
