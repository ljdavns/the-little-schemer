(define multirember 
  (lambda (a lat)
    (cond 
      ((null? lat) '())
      ((eq? a (car lat)) (multirember a (cdr lat)))
      (else 
        (cons (car lat) (multirember a (cdr lat)))
      )
    )
  )
)

(print 
  (multirember 'aa '(aa bb aa dd aa ff))
)

(print 
  (multirember 'bb '(aa bb aa dd aa ff))
)

(print 
  (multirember 'aa '(aa bb aa aa aa))
)

(print 
  (multirember 'bb '(aa bb aa aa aa))
)