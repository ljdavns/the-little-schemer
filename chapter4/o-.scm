
; Assume add1 is a primitive
;
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

; (o+ 2 3)
; (add1 (o+ 2 (sub1 3)))
; (add1 (o+ 2 2))
; (add1 (add1 (o+ 2 (sub1 2))))
; (add1 (add1 (o+ 2 1)))
; (add1 (add1 (add1 (o+ 2 (sub1 1)))))
; (add1 (add1 (add1 (o+ 2 0))))
; (add1 (add1 (add1 2)))
; (add1 (add1 3))
; (add1 4)
; 5

(print
  (o+ 2 3)
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

(print
  (o- 6 3)
)
