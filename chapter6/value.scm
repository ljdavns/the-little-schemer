(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

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

; Examples of value
;
(value 13)                                   ; 13
(value '(1 o+ 3))                            ; 4
(value '(1 o+ (3 o^ 4)))                     ; 82

; The value function for prefix notation
;
(define value-prefix
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (car nexp) 'o+)
       (+ (value-prefix (car (cdr nexp)))
          (value-prefix (car (cdr (cdr nexp))))))
      ((eq? (car nexp) 'o*)
       (* (value-prefix (car (cdr nexp)))
          (value-prefix (car (cdr (cdr nexp))))))
      ((eq? (car nexp) 'o^)
       (expt (value-prefix (car (cdr nexp)))
             (value-prefix (car (cdr (cdr nexp))))))
      (else #f))))

; Examples of value-prefix
;
(value-prefix 13)                            ; 13
(value-prefix '(o+ 3 4))                     ; 7
(value-prefix '(o+ 1 (o^ 3 4)))              ; 82

; It's best to invent 1st-sub-exp and 2nd-sub-exp functions
; instead of writing (car (cdr (cdr nexp))), etc.
; These are for prefix notation.
;
(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

; It's also best to invent operator function,
; instead of writing (car nexp), etc.
; This is for prefix notation
;
(define operator
  (lambda (aexp)
    (car aexp)))

; The new value function that uses helper functions
;
(define value-prefix-helper
  (lambda (nexp)
    (cond
      ((atom? nexp) nexp)
      ((eq? (operator nexp) 'o+)
       (+ (value-prefix (1st-sub-exp nexp))
          (value-prefix (2nd-sub-exp nexp))))
      ((eq? (car nexp) 'o*)
       (* (value-prefix (1st-sub-exp nexp))
          (value-prefix (2nd-sub-exp nexp))))
      ((eq? (car nexp) 'o^)
       (expt (value-prefix (1st-sub-exp nexp))
             (value-prefix (2nd-sub-exp nexp))))
      (else #f))))

; Examples of value-prefix-helper
;
(value-prefix-helper 13)                            ; 13
(value-prefix-helper '(o+ 3 4))                     ; 7
(value-prefix-helper '(o+ 1 (o^ 3 4)))              ; 82