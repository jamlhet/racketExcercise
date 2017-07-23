#lang racket
(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))
;(display z)
;(display "\n")
;(cons (cons 1 (cons 2 3)) 4)

(display "List a: ") (define a (list 1 2 3 4 5 6)) (display a)(display "\n") 
;(display "car: ") (car a)
;(display "cdr a: ") (cdr a)
;(display "car (list 1 2 3 4): ") (car (list 1 2 3 4))
;(display "cadr (list 1 2 3 4): ") (cadr (list 1 2 3 4))
;(display "caddr (list 1 2 3 4): ") (caddr (list 1 2 3 4))
;(display "cadddr (list 1 2 3 4): ") (cadddr (list 1 2 3 4))
;(display "(caar (cons (cons 1 2) (cons 3 4))): ") (caar (cons (cons 1 2) (cons 3 4)))

(display "List a[0]: ") (list-ref a 0)

(define (list-object items n)
  (if (= n 0) (car items)
      (list-object (cdr items) (- n 1))))

(display "List a[2]: ") (list-object a 2)
(length (list 1 2 3 4))
(list-ref (list 'a 'b 'c) 0)
(list-ref (cons 1 2) 0)
(list-tail (cons 1 2) 1)
(append (list 1 2) (list 3 4))
(reverse (list 1 2 3 4))
'(1 2 3 4)

(map (lambda (number)
       (+ 1 number))
       '(1 2 3 4))

 (map (lambda (number1 number2)
         (+ number1 number2))
       '(1 2 3 4)
       '(10 100 1000 10000))
 
(for-each (lambda (arg) (printf "Got ~a\n" arg))
            '(1 2 3 4))

(foldl + 0 '(1 2 3 4))
(foldl + 1 '(1 2 3 4))
(foldl (lambda (a b result)
           (* result (- a b)))
         1
         '(1 2 3)
         '(4 5 6))


(foldr (lambda (v l) (cons (add1 v) l)) '() '(1 2 3 4))

(add1 0)

(define treeJuan (cons (list 1 2) (list 3 4)))
(length treeJuan)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(count-leaves treeJuan)

