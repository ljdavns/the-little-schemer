(define insertR 
  (lambda (new old lat) 
    (cond 
      ((null? lat) '())
      ((eq? old (car lat)) 
        (cons old (cons new (cdr lat))))
      (else 
        (cons (car lat) (insertR new old (cdr lat)))
      )
    )
  )
)

(insertR 'dd 'cc '(aa bb cc ee))
