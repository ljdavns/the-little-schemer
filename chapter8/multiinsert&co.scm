(define multiinsertLR 
  (lambda (new oldL oldR lat) 
    (cond
      ((null? lat) '()) 
      ((eq? (car lat) oldL) 
        (cons new (cons oldL (multiinsertLR new oldL oldR (cdr lat)))))
      ((eq? (car lat) oldR) 
        (cons oldR (cons new (multiinsertLR new oldL oldR (cdr lat)))))
      (else 
        (cons (car lat) (multiinsertLR new oldL oldR (cdr lat)))))))

(print (multiinsertLR
  'x
  'a
  'b
  '(a o a o b o b b a b o)))
; ==> '(x a o x a o b x o b x b x x a b x o))

(define multiinsertLR&co 
  (lambda (new oldL oldR lat col) 
    (cond 
      ((null? lat) 
        (col '() 0 0)) 
      ((eq? (car lat) oldL) 
        (multiinsertLR&co new oldL oldR 
        (cdr lat) 
        (lambda (newlat L R) 
          (col (cons new (cons oldL newlat)) (+ 1 L) R))))  
      ((eq? (car lat) oldR) 
        (multiinsertLR&co new oldL oldR 
        (cdr lat) 
        (lambda (newlat L R) 
          (col (cons oldR (cons new newlat)) L (+ 1 R))))) 
      (else 
        (multiinsertLR&co new oldL oldR 
        (cdr lat) 
        (lambda (newlat L R) 
          (col (cons (car lat) newlat) L R)))))))

; Some collectors
;
(define col1
  (lambda (lat L R)
    lat))
(define col2
  (lambda (lat L R)
    L))
(define col3
  (lambda (lat L R)
    R))
       
; Examples of multiinsertLR&co
;
(print (multiinsertLR&co
  'salty
  'fish
  'chips
  '(chips and fish or fish and chips)
  col1))
; ==> '(chips salty and salty fish or salty fish and chips salty)
(print (multiinsertLR&co
  'salty
  'fish
  'chips
  '(chips and fish or fish and chips)
  col2))
; ==> 2
(print (multiinsertLR&co
  'salty
  'fish
  'chips
  '(chips and fish or fish and chips)
  col3))
; ==> 2
(print (multiinsertLR&co
  'salty
  'fish
  'chips
  '(chips and fish or fish and)
  col3))
; ==> 1


(define multiinsertLR&co 
  (lambda (new oldL oldR lat col) 
    (cond 
      ((null? lat) 
        (col '())) 
      ((eq? (car lat) oldL) 
        (multiinsertLR&co new oldL oldR 
        (cdr lat) 
        (lambda (newlat) 
          (col (cons new (cons oldL newlat))))))  
      ((eq? (car lat) oldR) 
        (multiinsertLR&co new oldL oldR 
        (cdr lat) 
        (lambda (newlat) 
          (col (cons oldR (cons new newlat)))))) 
      (else 
        (multiinsertLR&co new oldL oldR 
        (cdr lat) 
        (lambda (newlat) 
          (col (cons (car lat) newlat))))))))

; Examples of multiinsertLR&co
;
(print (multiinsertLR&co
  'salty
  'fish
  'chips
  '(chips and fish or fish and chips)
  (lambda (lat)
    lat)))
; ==> '(chips salty and salty fish or salty fish and chips salty)
