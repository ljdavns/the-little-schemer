(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

; The union function finds union of two sets
;
(define union
  (lambda (set1 set2)
    (cond
      ((null? set1) set2)
      ((member? (car set1) set2) (union (cdr set1) set2))
      (else (cons (car set1) (union (cdr set1) set2))))))

; Example of union
;
(print (union
  '(stewed tomatoes and macaroni casserole)
  '(macaroni and cheese)))
; ==> '(stewed tomatoes casserole macaroni and cheese)

; The xxx function is the set difference function
;
(define xxx
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2) (xxx (cdr set1) set2))
      (else (cons (car set1) (xxx (cdr set1) set2))))))

; Example of set difference
;
(print (xxx '(a b c) '(a b d e f)))     ; '(c)

; The intersect function finds the intersect between two sets
;
(define intersect
  (lambda (set1 set2)
    (cond
      ((null? set1) '())
      ((member? (car set1) set2)
       (cons (car set1) (intersect (cdr set1) set2)))
      (else
        (intersect (cdr set1) set2)))))

; The intersectall function finds intersect between multitude of sets
;
(define intersectall
  (lambda (l-set)
    (cond
      ((null? (cdr l-set)) (car l-set))
      (else
        (intersect (car l-set) (intersectall (cdr l-set)))))))

; Examples of intersectall
;
(print (intersectall '((a b c) (c a d e) (e f g h a b))))       ; '(a)
(print (intersectall
  '((6 pears and)
    (3 peaches and 6 peppers)
    (8 pears and 6 plums)
    (and 6 prunes with some apples))))                   ; '(6 and)
