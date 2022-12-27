(define add1
  (lambda (n) (+ n 1)))


; Assume sub1 is a primitive
;
(define sub1
  (lambda (n) (- n 1)))


(define o+
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else
        (add1 (o+ n (sub1 m))))
    )
  )
)

(define o*
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else
        (o+ n (o* n (sub1 m)))
      )
    )
  )
)

(define o^ 
  (lambda (n m)
    (cond
      ((eq? m 0) n)
      (else 
        (o* n (o^ n (sub1 m)))
      )
    )
  )
)


(print 
  (o^ 4 2)
)

(print
  (o^ 2 4)
)
