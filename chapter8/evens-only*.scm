; The multiremember&co uses a collector
;
(define multiremember&co
  (lambda (f lat col)
    (cond
      ((null? lat)
       (col '() '()))
      ((f (car lat))
       (multiremember&co f (cdr lat)
         (lambda (newlat seen)
           (col newlat (cons (car lat) seen)))))
      (else
        (multiremember&co f (cdr lat)
                          (lambda (newlat seen)
                            (col (cons (car lat) newlat) seen)))))))

;; evens only with one dimension list
(define evens-only* 
  (lambda (l)
    (multiremember&co 
      even? 
      l
      (lambda (x y) y))))

(print (evens-only* '(1 2 3 4 5 7 6 9)))

(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

(define evens-only*
  (lambda (l) 
    (cond 
      ((null? l) '())
      ((atom? (car l)) 
        (cond
          ((even? (car l)) (cons (car l) (evens-only* (cdr l))))
          (else (evens-only* (cdr l)))))
      (else (cons (evens-only* (car l)) (evens-only* (cdr l)))))))


(print (evens-only* '(1 2 3 4 5 6 7 9 10 11)))
(print (evens-only* '((9 1 2 8) 3 10 ((9 9) 7 6) 2)))