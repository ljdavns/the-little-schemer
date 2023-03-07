(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

;; evens-only*&co 
;; It builds a nested list of even numbers by removing the odd ones from its argument 
;; and simultaneously multiplies the even numbers and sums up the odd numbers 
(define evens-only*&co 
  (lambda (l col) 
    (cond 
      ((null? l) (col 1 0))
      ((atom? (car l)) 
        (cond
          ((even? (car l)) 
            (evens-only*&co 
              (cdr l) 
              (lambda (newl even odd) 
                (col (cons (car l) newl) (* (car l) even) odd))))
          (else (evens-only*&co 
              (cdr l) 
              (lambda (newl even odd) 
                (col newl even (+ (car l) odd)))))))
      (else 
        (evens-only*&co 
          (car l)
          (lambda (newl even odd)
            (lambda (innerl innere innero)
              (col (cons newl innerl) (* innere even) (+ innero odd)))))))))

; evens-friend returns collected evens
;
(define evens-friend
  (lambda (e p s)
    e))

; Example of evens-friend used
;
(print (evens-only*&co 
  '((9 1 2 8) 3 10 ((9 9) 7 6) 2)
  evens-friend))
; ==> '((2 8) 10 (() 6) 2)