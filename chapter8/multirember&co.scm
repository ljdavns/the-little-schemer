; The multiremember&co uses a collector
;
(define multiremember&co
  (lambda (a lat col)
    (cond
      ((null? lat)
       (col '() '()))
      ((eq? (car lat) a)
       (multiremember&co a (cdr lat)
         (lambda (newlat seen)
           (col newlat (cons (car lat) seen)))))
      (else
        (multiremember&co a (cdr lat)
                          (lambda (newlat seen)
                            (col (cons (car lat) newlat) seen)))))))

; The friendly function
;
(define a-friend
  (lambda (x y)
    (null? y)))

(print (a-friend 'a '()))

; Examples of multiremember&co with friendly function
;
(print (multiremember&co
  'tuna
  '(strawberries tuna and swordfish)
  a-friend))
; ==> #f

;; (multiremember&co 'tuna '(strawberries tuna and swordfish) a-friend)
;; (multiremember&co 'tuna '(tuna and swordfish) (lambda (newlat seen) (a-friend (cons 'strawberries newlat) seen)))
;; (multiremember&co 'tuna '(and swordfish) (lambda (newlat seen) ((a-friend (cons 'strawberries newlat) (cons 'tuna seen)))))
;; (multiremember&co 'tuna '(swordfish) (lambda (newlat seen) (((a-friend (cons 'strawberries (cons 'and newlat)) (cons 'tuna seen))))))
;; (multiremember&co 'tuna '()  (lambda (newlat seen) ((((a-friend (cons 'strawberries (cons 'and (cons 'swordfish newlat))) (cons 'tuna seen)))))))
;; (col '() '())
;; ((((a-friend (cons 'strawberries (cons 'and (cons 'swordfish '()))) (cons 'tuna '())))))

(print (multiremember&co
  'tuna
  '()
  a-friend))
; ==> #t
(print (multiremember&co
  'tuna
  '(tuna)
  a-friend))
; ==> #f

; The new friend function
;
(define new-friend
  (lambda (newlat seen)
    (a-friend newlat (cons 'tuna seen))))

; Examples of multiremember&co with the new friend function
;
(multiremember&co
  'tuna
  '(strawberries tuna and swordfish)
  new-friend)
; ==> #f
(multiremember&co
  'tuna
  '()
  new-friend)
; ==> #f
(multiremember&co
  'tuna
  '(tuna)
  new-friend)
; ==> #f

; The last friend function
;
(define last-friend
  (lambda (x y)
    (length x)))

; Examples of multiremember&co with the last friend function
;
(print (multiremember&co
  'tuna
  '(strawberries tuna and swordfish)
  last-friend))
; ==> 3
(print (multiremember&co
  'tuna
  '()
  last-friend))
; ==> 0
(print (multiremember&co
  'tuna
  '(tuna)
  last-friend))
; ==> 0

(print (multiremember&co
  'tuna
  '(strawberries tuna swordfish)
  last-friend))
; ==> 2