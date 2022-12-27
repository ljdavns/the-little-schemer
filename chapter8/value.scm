(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

; Remember the value function from Chapter 6 (06-shadows.ss)?
;
(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (car (cdr nexp)) 'o+)
       (+ (value (car nexp))
          (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) 'o*)
       (* (value (car nexp))
          (value (car (cdr (cdr nexp))))))
      ((eq? (car (cdr nexp)) 'o^)
       (expt (value (car nexp))
             (value (car (cdr (cdr nexp))))))
      (else #f))))

; Let's abstract it
;
(define atom-to-function
  (lambda (atom)
    (cond
      ((eq? atom 'o+) +)
      ((eq? atom 'o*) *)
      ((eq? atom 'o^) expt)
      (else #f))))

; atom-to-function uses operator
;
(define operator
  (lambda (aexp)
    (car aexp)))

; The value function rewritten to use abstraction
;
(define value
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      (else
        ((atom-to-function (operator nexp))
         (value (1st-sub-exp nexp))
         (value (2nd-sub-exp nexp)))))))

; value uses 1st-sub-exp
;
(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

; value uses 2nd-sub-exp
(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

; Test value
;
(print (value 13))                                   ; 13
(print (value '(o+ 1 3)))                            ; 4
(print (value '(o+ 1 (o^ 3 4))))                     ; 82