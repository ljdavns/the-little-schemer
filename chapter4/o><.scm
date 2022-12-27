(define add1
  (lambda (n) (+ n 1)))


; Assume sub1 is a primitive
;
(define sub1
  (lambda (n) (- n 1)))


; The o+ function adds two numbers
;
(define o+
  (lambda (n m)
    (cond
      ((zero? m) n)
      (else
        (add1 (o+ n (sub1 m)))
      )
    )
  )
)

(define o> 
  (lambda (n m)
    (cond
      ((zero? m) #t)
      ((zero? n) #f)
      (else
        (o> (sub1 n) (sub1 m))
      )
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

(print 
  (o> 4 6)
)

(print
  (o> 5 4)
)

(print 
  (o< 4 6)
)

(print
  (o< 5 4)
)
