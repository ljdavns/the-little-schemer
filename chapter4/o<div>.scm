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

(define o< 
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else
        (o< (sub1 n) (sub1 m))
      )
    )
  )
)

(define o-
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else
        (sub1 (o- n (sub1 m))))
    )
  )
)

(define o/
  (lambda (n m)
    (cond
      ((o< n m) 0)
      (else 
        (add1 (o/ (o- n m) m))
      )
    )
  )
)


(print 
  (o/ 2 4)
)

(print 
  (o/ 4 2)
)

(print
  (o/ 32 4)
)

(print
  (o/ 128 2)
)
