(define sub1
  (lambda (n) (- n 1)))

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((number? (car lat)) (no-nums (cdr lat)))
      (else 
        (cons (car lat) (no-nums (cdr lat)))
      )
    )
  )
)

(print 
  (no-nums '(a b 3 d e 6 g 8))
)
