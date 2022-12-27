; The a-pair? function determines if it's a pair
;
(define a-pair?
  (lambda (x)
    (cond
      ((atom? x) #f)
      ((null? x) #f)
      ((null? (cdr x)) #f)
      ((null? (cdr (cdr x))) #t)
      (else #f))))

; Examples of pairs
;
(a-pair? '(pear pear))          ; #t
(a-pair? '(3 7))                ; #t
(a-pair? '((2) (pair)))         ; #t
(a-pair? '(full (house)))       ; #t

; Examples of not-pairs
(a-pair? '())                   ; #f
(a-pair? '(a b c))              ; #f

; Helper functions for working with pairs
;
(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))

; Just an example of how you'd write third
;
(define third
  (lambda (l)
    (car (cdr (cdr l)))))

; Example of a not-relations
;
'(apples peaches pumpkins pie)
'((apples peaches) (pumpkin pie) (apples peaches))

; Examples of relations
;
'((apples peaches) (pumpkin pie))
'((4 3) (4 2) (7 6) (6 2) (3 4))