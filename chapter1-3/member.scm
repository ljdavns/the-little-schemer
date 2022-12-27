(define member? 
  (lambda (a lat) 
    (cond 
      ((null? lat) #f) 
      (else (or (eq? (car lat) a) 
      (member? a (cdr lat)))))))

; Examples of member? succeeding
;
(print
  (member? 'meat '(mashed potatoes and meat gravy))
)
(print
  (member? 1 '(1 2 and 3 gravy))
)
;; (member? 'meat '(mashed potatoes and meat gravy))
;; (member? 'meat '(potatoes and meat gravy))
;; (member? 'meat '(and meat gravy))
;; (member? 'meat '(meat gravy))

;; ; Examples of member? failing
;; (member? 'liver '(bagels and lox))
;; (member? 'liver '())
