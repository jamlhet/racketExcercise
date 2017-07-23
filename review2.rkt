(define (factorial1 x)
  (if (= 1 x)
      1
   (if (= 0 x)
       1
       (* x (factorial1 (- x 1)))
  )))

(factorial1 2)
(factorial1 3)
(factorial1 4)
(factorial1 5)
(factorial1 6)
;;;---------------------------------------
(define (factorial2 n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (display product)
  (display "-")
  (display counter)
  (display "-")
  (display max-count)
  (display "\n")
  (if (> counter max-count)      
      product
      (fact-iter (* counter product) (+ counter 1) max-count)))

(factorial2 2)
(factorial2 3)
(factorial2 4)
(factorial2 5)
(factorial2 6)
;;;----------------------------------------
(define (fib x)
  (cond ((= x 0) 0)
        ((= x 1) 1)
        (else (+ (fib (- x 1)) (fib (- x 2))))
      )
  )

(fib 0)
(fib 1)
(fib 2)
(fib 10)
(fib 100)
