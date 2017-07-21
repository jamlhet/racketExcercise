(define (factorial x)
  (if (= 1 x)
      1
   (if (= 0 x)
       1
       (* x (factorial (- x 1)))
  )))

(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)
(factorial 6)

(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter + counter max-count)
  (if (> counter  )
      product(fact-iter (* counter product)
                        (+ counter 1)
                        max-count)))

(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)
(factorial 6)