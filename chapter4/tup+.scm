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

(define tup+ 
  (lambda (tup1 tup2)
      (cond
        ((null? tup1) tup2)
        ((null? tup2) tup1)
      (else
        (cons 
          (o+ (car tup1) (car tup2)) 
          (tup+ (cdr tup1) (cdr tup2))
        )
      )
    )
  )
)

(print 
  (tup+ '(1 2 3) '(2 3 1))
)

(print
  (tup+ '(1 2 3) '(2 3 1 1 2))
)