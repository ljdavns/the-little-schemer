; The multirember function from Chapter 3 (03-cons-the-magnificent.ss)
;
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a)
       (multirember a (cdr lat)))
      (else
        (cons (car lat) (multirember a (cdr lat)))))))

; The multirember-f is multirember with a possibility to curry f
;
(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond
       ((null? lat) '())
       ((test? a (car lat))
        ((multirember-f test?) a (cdr lat)))
       (else (cons (car lat)
                   ((multirember-f test?) a (cdr lat))))))))

; Curry multirember-f with eq?
;
(define multirember-eq? (multirember-f eq?))

; Test multirember-f
;
(print ((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna)))
; ==> '(shrimp salad salad and)

(print ((multirember-f eq?) 'salad '(shrimp salad tuna salad and tuna)))
; ==> '(shrimp tuna and tuna)

(define multiremberT
  (lambda (test? lat)
    (cond
      ((null? lat) '())
      ((test? (car lat)) (multiremberT test? (cdr lat)))
      (else (cons (car lat)
                  (multiremberT test? (cdr lat)))))))

; The eq?-c function takes an atom and returns a function that
; takes an atom and tests if they are the same
;
(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? a x))))

; eq?-tuna tests if element is equal to 'tuna
;
(define eq?-tuna
  (eq?-c 'tuna))

; Example of multiremberT
;
(print (multiremberT
  eq?-tuna
  '(shrimp salad tuna salad and tuna)))
; ==> '(shrimp salad salad and)

; Example of multiremberT
;
(print (multiremberT
          (eq?-c 'salad)
          '(shrimp salad tuna salad and tuna)))
; ==> '(shrimp tuna and tuna)