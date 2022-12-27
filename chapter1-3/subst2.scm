(define subst2 
  (lambda (new o1 o2 lat)
    (cond 
      ((null? lat) '())
      ((or (eq? o1 (car lat)) (eq? o2 (car lat)) )
        (cons new (cdr lat)))
      (else 
        (cons (car lat) (subst2 new o1 o2 (cdr lat)))
      )
    )
  )
)

(print 
  (subst2 'rep 'cc 'dd '(aa bb cc dd ee))
)

(print 
  (subst2 'rep 'cc1 'dd '(aa bb cc dd ee))
)
; (subst2 'rep 'cc 'dd '(aa bb cc dd ee))