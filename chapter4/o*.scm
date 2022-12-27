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

; (o* 3 2)
; (o+ 3 (o* 3 (sub1 2)))
; (o+ 3 (o* 3 1))
; (o+ 3 (o+ 3 (o* sub1(1))))
; (o+ 3 (o+ 3 (o* 0)))
; (o+ 3 (o+ 3 0))
; (o+ 3 3)
; 6

(o* 3 6)