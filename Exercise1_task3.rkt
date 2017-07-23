#lang racket
(define (sq x) (* x x))
(define (2bl x) (* 2 x))
(define (new_fun fun1 fun2) (lambda (x) (fun2 (fun1 x))))
;((new_fun sq mul2bl) 10)
;(lambda (f) (lambda (x) (f x)))

(define (n) (lambda (x) (x x)))
(define (philo fun1 fun2) (lambda (x) (fun1 (fun2 x))))
(n)
(philo (n) (+ n 1))

(define (eval-with env) 
  (lambda (exp) (eval exp env)))