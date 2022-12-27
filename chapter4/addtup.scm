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
        (add1 (o+ n (sub1 m))))
    )
  )
)

(define addtup 
  (lambda (tup) 
    (cond 
      ((null? tup) 0) 
      (else
        (o+ (car tup) (addtup (cdr tup)))
      )
    )
  )
)

(addtup '(1 2 3 4))