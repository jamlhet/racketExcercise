(define (cube x) (* x x x))
(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-cubes2 a b)
  (sum cube a inc b))

;(sum-cubes2 1 3)
;(display "((lambda (x) (+ x 4)) 1) => ")
;((lambda (x) (+ x 4)) 1)

(define (pi-sum3 a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2)))) a
       (lambda (x) (+ x 4)) b
       )
  )

;(pi-sum3 1 2)
;-----
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (display f)(display ", ")(display first-guess)(display "\n")
  
  (define (close-enough? v1 v2)
    ;(display "v1: ")(display v1)(display ", v2: ")(display v2)(display "\n")
    (< (abs (- v1 v2)) tolerance))
  
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  
  (try first-guess))

;(fixed-point cos 2)
;(cos 2)
;(display "(let ([word-list <VALUE>]) <BODY>) Example: (let ((x 5)) x) => ")
;(let ((x 5)) x)
(define (average x y) (/ (+ x y) 2) )
(define (sqrt3 x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))
;(sqrt3 4)

(define (square x) (* x x))
(define (average-damp f)
  (lambda (x) (average x (f x))))
;((average-damp square) 10)
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))