; The intersect? function finds if two sets intersect
;
(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      ((member? (car set1) set2) #t)
      (else
        (intersect? (cdr set1) set2)))))

; Examples of intersect?
;
(intersect?
  '(stewed tomatoes and macaroni)
  '(macaroni and cheese))
; ==> #t

(intersect?
  '(a b c)
  '(d e f))
; ==> #f

; A shorter version of intersect?
;
(define intersect?
  (lambda (set1 set2)
    (cond
      ((null? set1) #f)
      (else (or (member? (car set1) set2)
                (intersect? (cdr set1) set2))))))

; Tests of intersect?
;
(intersect?
  '(stewed tomatoes and macaroni)
  '(macaroni and cheese))
; ==> #t

(intersect?
  '(a b c)
  '(d e f))
; ==> #f

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

; Example of intersect
;
(intersect
  '(stewed tomatoes and macaroni)
  '(macaroni and cheese))
; ==> '(and macaroni)
