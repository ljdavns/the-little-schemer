
; The atom? primitive
;
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; The rember-f function takes the test function, element, and a list
; and removes the element that test true
;
(define rember-f
  (lambda (test? a l)
    (cond
      ((null? l) '())
      ((test? (car l) a) (cdr l))
      (else
        (cons (car l) (rember-f test? a (cdr l)))))))

; Examples of rember-f
;
(rember-f eq? 2 '(1 2 3 4 5))
; ==> '(1 3 4 5)

; The eq?-c function takes an atom and returns a function that
; takes an atom and tests if they are the same
;
(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? a x))))

; Example of eq?-c
;
((eq?-c 'tuna) 'tuna)       ; #t
((eq?-c 'tuna) 'salad)      ; #f

(define eq?-salad (eq?-c 'salad))

; Examples of eq?-salad
;
(eq?-salad 'salad)          ; #t
(eq?-salad 'tuna)           ; #f

; Another version of rember-f that takes test as an argument
; and returns a function that takes an element and a list
; and removes the element from the list
;
(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond
        ((null? l) '())
        ((test? (car l) a) (cdr l))
        (else
          (cons (car l) ((rember-f test?) a (cdr l))))))))

; Test of rember-f
;
((rember-f eq?) 2 '(1 2 3 4 5))
; ==> '(1 3 4 5)

; Curry (rember-f eq?)
;
(define rember-eq? (rember-f eq?))

; Test curried function
;
(rember-eq? 2 '(1 2 3 4 5))
; ==> '(1 3 4 5)
(rember-eq? 'tuna '(tuna salad is good))
; ==> '(salad is good)
(rember-eq? 'tuna '(shrimp salad and tuna salad))
; ==> '(shrimp salad and salad)
(rember-eq? 'eq? '(equal? eq? eqan? eqlist? eqpair?))
; ==> '(equal? eqan? eqlist? eqpair?)
