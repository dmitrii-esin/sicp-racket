#lang racket/base

(require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (cube n) (* n n n))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

(define solution (sum-cubes 1 10))

(check-equal? solution 3025)
