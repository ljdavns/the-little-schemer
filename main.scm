(define evens-only*
  (lambda (l) 
    (cond 
      ((null? l) '()))
      ((atom? l))