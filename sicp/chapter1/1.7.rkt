#lang racket/base

(require rackunit)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
        (< (abs (- (square guess) x)) guess))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x))

(define solution1 (sqrt 0.0019))

(define solution2 (sqrt 7678))

(check-equal? solution1 1.0)

(check-equal? solution2 87.62567040902627)