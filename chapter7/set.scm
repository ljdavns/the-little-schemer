(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

; atom? function from Chapter 1 (01-toys.ss)
(define atom?
 (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define set?
  (lambda (lat)
    (cond
      ((eq? lat '()) #t)
      ((member? (car lat) (cdr lat)) #f)
      (else (set? (cdr lat))))))

; The makeset funciton takes a lat and produces a set
;
(define makeset
  (lambda (lat)
    (cond
      ((null? lat) '())
      ((member? (car lat) (cdr lat)) (makeset (cdr lat)))
      (else (cons (car lat) (makeset (cdr lat)))))))

(print (makeset '(apple peach pear peach plum apple lemon peach)))

; makeset via multirember from Chapter 3 (03-cons-the-magnificent.ss)
;
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a)
       (multirember a (cdr lat)))
      (else
        (cons (car lat) (multirember a (cdr lat)))))))

(define makeset
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
        (cons (car lat)
              (makeset (multirember (car lat) (cdr lat))))))))

; Test makeset
;
(print (makeset '(apple peach pear peach plum apple lemon peach)))
; ==> '(apple peach pear plum lemon)

(print (makeset '(apple 3 pear 4 9 apple 3 4)))
; ==> '(apple 3 pear 4 9)