; The eqset? function determines if two sets are equal
;
(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1))))

; Examples of eqset?
;
(eqset? '(a b c) '(c b a))          ; #t
(eqset? '() '())                    ; #t
(eqset? '(a b c) '(a b))            ; #f
