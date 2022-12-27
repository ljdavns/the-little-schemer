; The atom? primitive
;
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; The numbered? function determines whether a representation of an arithmetic
; expression contains only numbers besides the o+, ox and o^ (for +, * and exp).
;
(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      ((eq? (car (cdr aexp)) 'o+)
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) 'ox)
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))))
      ((eq? (car (cdr aexp)) 'o^)
       (and (numbered? (car aexp))
            (numbered? (car (cdr (cdr aexp))))))
      (else #f))))

; Examples of numbered?
;
(print (numbered? '5))                               ; #t
(print (numbered? '(5 o+ 5)))                        ; #t
(print (numbered? '(5 o+ a)))                        ; #f
(print (numbered? '(5 ox (3 o^ 2))))                 ; #t
(print (numbered? '(5 ox (3 'foo 2))))               ; #f
(print (numbered? '((5 o+ 2) ox (3 o^ 2))))          ; #t


; Assuming aexp is a numeric expression, numbered? can be simplified
;
(define numbered?
  (lambda (aexp)
    (cond
      ((atom? aexp) (number? aexp))
      (else
        (and (numbered? (car aexp))
             (numbered? (car (cdr (cdr aexp)))))))))

; Examples of numbered?
;
(print (numbered? '5))                               ; #t
(print (numbered? '(5 o+ 5)))                        ; #t
(print (numbered? '(5 o+ a)))                        ; #f
(print (numbered? '(5 ox (3 o^ 2))))                 ; #t
(print (numbered? '(5 ox (3 'foo 2))))               ; #f
(print (numbered? '((5 o+ 2) ox (3 o^ 2))))          ; #t