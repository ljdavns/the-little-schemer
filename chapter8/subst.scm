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

; The subst function from Chapter 3 (03-cons-the-magnificent.ss)
;
(define subst-f
  (lambda (new old l)
    (cond
      ((null? l) '())
      ((eq? (car l) old)
       (cons new (cdr l)))
      (else
        (cons (car l) (subst new old (cdr l)))))))

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

; Guess what yyy is
;
(define yyy
  (lambda (a l)
    ((insert-g seqrem) #f a l)))

; yyy uses seqrem
(define seqrem
  (lambda (new old l)
    l))

; It's rember! Let's test it.
;
(print (yyy
  'sausage
  '(pizza with sausage and bacon)))      ; '(pizza with and bacon)
