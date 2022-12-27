(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; The add1 primitive
;
(define add1
  (lambda (n) (+ n 1)))


(define rember*
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((atom? (car lat)) 
        (cond 
          ((eq? a (car lat)) (rember* a (cdr lat)))
          (else
            (cons (car lat) (rember* a (cdr lat)))
          )
        )
      )
      (else
        (cons (rember* a (car lat)) (rember* a (cdr lat)))
      )
    )
  )
)

(rember* 'a '(a (a b c) (d a c) a (c a d)))