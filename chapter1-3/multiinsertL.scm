(define multiinsertL 
  (lambda (new old lat) 
    (cond 
      ((null? lat) '())
      ((eq? old (car lat)) 
        (cons new (cons old (multiinsertL new old (cdr lat)))))
      (else 
        (cons (car lat) (multiinsertL new old (cdr lat)))
      )
    )
  )
)

(print
  (multiinsertL 'cc 'dd '(aa bb dd ee dd ee dd dd))
)