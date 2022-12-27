; The seqL function is what insertL does that insertR doesn't
;
(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

; The seqR function is what insertR does that insertL doesn't
;
(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

; insert-g acts as insertL or insertR depending on the helper
; function passed to it
;
(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond
        ((null? l) '())
        ((eq? (car l) old) (seq new old (cdr l)))
        (else (cons (car l) ((insert-g seq) new old (cdr l))))))))

; insertL is now just (insert-g seqL)
;
(define insertL (insert-g seqL))

; insertR is now just (insert-g seqR)
;
(define insertR (insert-g seqR))

; Test insertL
;
(print (insertL
  'd
  'e
  '(a b c e f g d h)))                  ; '(a b c d e f g d h)

; Test insertR
(print (insertR
  'e
  'd
  '(a b c d f g d h)))                  ; '(a b c d e f g d h)

; The seqS function is what subst does that neither insertL nor insertR do
;
(define seqS
  (lambda (new old l)
    (cons new l)))

; subst is now just (insret-g seqS)
;
(define subst (insert-g seqS))

; Test subst
;
(print (subst
  'topping
  'fudge
  '(ice cream with fudge for dessert))) ; '(ice cream with topping for dessert)
