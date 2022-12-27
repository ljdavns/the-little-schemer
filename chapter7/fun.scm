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

; It uses firsts function from Chapter 3 (03-cons-the-magnificent.ss)
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else
        (cons (car (car l)) (firsts (cdr l)))))))

; The fun? function determines if rel is a function
;
(define fun?
  (lambda (rel)
    (set? (firsts rel))))


; Examples of fun?
;
(print (fun? '((4 3) (4 2) (7 6) (6 2) (3 4))))     ; #f
(print (fun? '((8 3) (4 2) (7 6) (6 2) (3 4))))     ; #t
(print (fun? '((d 4) (b 0) (b 9) (e 5) (g 4))))     ; #f

(define first
  (lambda (p)
    (car p)))

(define second
  (lambda (p)
    (car (cdr p))))

(define build
  (lambda (s1 s2)
    (cons s1 (cons s2 '()))))

; The revrel function reverses a relation
;
(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else (cons (build (second (car rel)) (first (car rel))) (revrel (cdr rel)))))))

; Example of revrel
;
(print (revrel '((8 a) (pumpkin pie) (got sick))))
; ==> '((a 8) (pie pumpkin) (sick got))

; Let's simplify revrel by using inventing revpair that reverses a pair
;
(define revpair
  (lambda (p)
    (build (second p) (first p))))

; Simplified revrel
;
(define revrel
  (lambda (rel)
    (cond
      ((null? rel) '())
      (else (cons (revpair (car rel)) (revrel (cdr rel)))))))

; Test of simplified revrel
; 
(print (revrel '((8 a) (pumpkin pie) (got sick))))
; ==> '((a 8) (pie pumpkin) (sick got))

; The fullfun? function determines if the given function is full
;
(define fullfun?
  (lambda (fun)
    (set? (seconds fun))))

; It uses seconds helper function
;
(define seconds
  (lambda (l)
    (cond
      ((null? l) '())
      (else
        (cons (second (car l)) (seconds (cdr l)))))))

; Examples of fullfun?
;
(print (fullfun? '((8 3) (4 2) (7 6) (6 2) (3 4))))     ; #f
(print (fullfun? '((8 3) (4 8) (7 6) (6 2) (3 4))))     ; #t
(print (fullfun? '((grape raisin)
            (plum prune)
            (stewed prune))))                    ; #f

; one-to-one? is the same fullfun?
;
(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))))

(print (one-to-one? '((8 3) (4 2) (7 6) (6 2) (3 4))))     ; #f
(print (one-to-one? '((8 3) (4 8) (7 6) (6 2) (3 4))))     ; #t
(print (one-to-one? '((grape raisin)
               (plum prune)
               (stewed prune))))                    ; #f

(print (one-to-one? '((chocolate chip) (doughy cookie))))
; ==> #t and you deserve one now!