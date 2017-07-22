(define (square x) (* x x))

(define (sum-of-squares x y)
(+ (square x) (square y)))

(define (f a)
(sum-of-squares (+ a 1) (* a 2)))
;;;---------------------------------------
(define (sqrt-iter suposseValue x)
  (if (good-enough? suposseValue x)
      suposseValue
      (sqrt-iter (improve suposseValue x)
                 x)))

(define (improve suposseValue x)
  (average suposseValue (/ x suposseValue)))

(define (average x y)
  (/ (+ x y) 2))
  
(define (good-enough? suposseValue x)
  (< (abs (- (square suposseValue) x)) 0.001))

(define (sqrtjuan x)
  (sqrt-iter 1.0 x))

(sqrtjuan 9)
(sqrtjuan (+ 100 37))
(sqrtjuan (+ (sqrtjuan 2) (sqrtjuan 3)))
(square (sqrtjuan 1000))

(define (sqrtJuan2 x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.000000000001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrtJuan2 9)
(sqrtJuan2 (+ 100 37))
(sqrtJuan2 (+ (sqrtJuan2 2) (sqrtJuan2 3)))
(square (sqrtJuan2 1000))
