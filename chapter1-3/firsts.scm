(define firsts 
  (lambda (l) 
    (cond 
      ((null? l) '()) 
      (else (cons (car (car l)) (firsts (cdr l))) )
    )
  )
)

(firsts '((a b) (c d) (e)))