(define insertL 
  (lambda (new old lat) 
    (cond 
      ((null? lat) '())
      ((eq? old (car lat)) 
        (cons new (cons old (cdr lat))))
      (else 
        (cons (car lat) (insertL new old (cdr lat)))
      )
    )
  )
)

(insertL 'cc 'dd '(aa bb dd ee))