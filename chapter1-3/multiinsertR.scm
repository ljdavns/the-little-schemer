(define multiinsertR 
  (lambda (new old lat) 
    (cond 
      ((null? lat) '())
      ((eq? old (car lat)) 
        (cons old (cons new (multiinsertR new old (cdr lat)))))
      (else 
        (cons (car lat) (multiinsertR new old (cdr lat)))
      )
    )
  )
)

(print
  (multiinsertR 'cc 'dd '(aa bb dd ee dd ee dd dd))
)