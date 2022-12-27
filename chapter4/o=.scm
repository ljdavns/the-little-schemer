(define add1
  (lambda (n) (+ n 1)))


; Assume sub1 is a primitive
;
(define sub1
  (lambda (n) (- n 1)))


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

(define o= 
  (lambda (n m)
    (cond
      ((or (o> n m) (o< n m)) #f)
      (else #t)
    )
  )
)


(print 
  (o= 4 6)
)

(print
  (o> 6 6)
)
