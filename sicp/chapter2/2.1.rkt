#lang racket/base

(require rackunit)

(define (make-rat n d)
  (define (normalize d)
    (if (< d 0)
     (- d)
     (+ d)))
  (cons n (normalize d)))

(define solution1 (make-rat 2 6))
(define solution2 (make-rat -2 6))
(define solution3 (make-rat 2 -6))

(check-equal? solution1 (cons 2 6))
(check-equal? solution2 (cons -2 6))
(check-equal? solution3 (cons 2 6))