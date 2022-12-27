(define subst 
  (lambda (new old lat) 
    (cond 
      ((null? lat) '())
      ((eq? old (car lat)) 
        (cons new (cdr lat)))
      (else 
        (cons (car lat) (subst new old (cdr lat)))
      )
    )
  )
)

(subst 'ccc 'cc '(aa bb cc dd))