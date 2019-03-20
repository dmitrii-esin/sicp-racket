#lang racket/base

(require rackunit)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define dx 0.00001)

(define tolerance 0.00001)

(define (square n) (* n n))

(define (cubic a b c) 
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(define solution (newtons-method (cubic 0 0 -8) 1))

(check-equal? solution 2.000000000036784)