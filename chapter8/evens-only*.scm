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

(define evens-only* 
  (lambda (l)
    (multiremember&co 
      even? 
      l
      (lambda (x y) y))))

(print (evens-only* '(1 2 3 4 5 7 6 9)))