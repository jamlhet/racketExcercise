#lang racket
(define (variable? e)
  (symbol? e))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (cond ((eqv? a1 0) a2)
        ((eqv? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s)
  (cadr s))

(define (audend s)
  (caddr s))

(define (make-product m1 m2)
  (cond ((or (eqv? m1 0) (eqv? m2 0)) 0)
        ((eqv? m1 1) m2)
        ((eqv? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (trigonometric? x)
  (or (and (pair? x) (eq? (car x) 'cos))
      (and (pair? x) (eq? (car x) '-cos))
      (and (pair? x) (eq? (car x) 'sen))
      (and (pair? x) (eq? (car x) '-sen))
      (and (pair? x) (eq? (car x) 'tan))
      (and (pair? x) (eq? (car x) '-tan))
      (and (pair? x) (eq? (car x) 'cot))
      (and (pair? x) (eq? (car x) '-cot))
      (and (pair? x) (eq? (car x) 'sec))
      (and (pair? x) (eq? (car x) '-sec))
      (and (pair? x) (eq? (car x) 'csc))
      (and (pair? x) (eq? (car x) '-csc))
      )
  )

(define (multiplier p)
  (cadr p))

(define (multiplicand p)
  (caddr p))

(define (replace q? a b ls)
  (cond ((null? ls) '()) 
    ((q? (car ls) b) (cons a (cdr ls)))
    (else (cons (car ls) (replace a b (cdr ls))))))

(define (trigonometricDeriv exp)
  (cond ((eq? (car exp) 'sen) ;(sen (x)) -> ((cos (x))
         (replace eq? 'cos 'sen exp)
         )
        ((eq? (car exp) 'cos) ;(cos (x)) -> (* (sen (x)) -1)
         ((lambda (function)
            (append '(*) (list function) (list -1)))
          (replace eq? 'sen 'cos exp))
         )
        ((eq? (car exp) 'tan) ;(tan (x)) -> (* (sec (x)) (sec (x)))
         ((lambda (function)
            (append '(*) (list function function)))
          (replace eq? 'sec 'tan exp))
         )
        ((eq? (car exp) 'cot) ;(cot (x)) -> (* (* (csc (x)) (csc (x))) -1)
         ((lambda (function)
            (append '(*) (list (append '(*) (list function function))) (list -1)))
          (replace eq? 'csc 'cot exp))
         )
        ((eq? (car exp) 'sec) ;(sec (x)) -> (* (sec (x)) (tan (x)))
         ((lambda (function)
            (append '(*) (list exp function)))
          (replace eq? 'tan 'sec exp))
         )
        ((eq? (car exp) 'csc) ;(csc (x)) -> (* (* (csc (x)) (cot (x))) -1)
         ((lambda (function)
            (append '(*) (list (append '(*) (list exp function))) (list -1)))
          (replace eq? 'cot 'csc exp))
         )
        )
  )

(define (deriv exp var)  
  (cond
    ((number? exp) 0)
    ((variable? exp)
     (if (same-variable? exp var) 1 0))
    ((sum? exp)
     (make-sum (deriv (addend exp) var)
               (deriv (audend exp) var)))
    ((product? exp)
     (make-sum
      (make-product (multiplier exp)
                    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
                    (multiplicand exp))))
    ((trigonometric? exp)
     (trigonometricDeriv exp)     
     )
    (else
     (error "unknown expression type -- deriv" exp))))

(deriv '(+ x 2) 'x)
(deriv '(+ (+ x 2) (* x x)) 'x)
(deriv '(sen (x)) 'x)
(deriv '(sen (+ x 2)) 'x)
(deriv '(cos (x)) 'x)
(deriv '(tan (x)) 'x)
(deriv '(cot (x)) 'x)
(deriv '(sec (x)) 'x)
(deriv '(csc (x)) 'x)