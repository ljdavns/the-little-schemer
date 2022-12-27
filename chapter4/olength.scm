(define add1
  (lambda (n) (+ n 1)))

(define olength
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else 
        (add1 (olength (cdr lat)))
      )
    )
  )
)


(print 
  (olength '(1 2 3))
)

(print 
  (olength '(a b c d e))
)
