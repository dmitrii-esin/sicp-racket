#lang racket/base

(require rackunit)

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define solution1 (car (cons 2 3)))
(define solution2 (cdr (cons -1 0)))

(check-equal? solution1 2)
(check-equal? solution2 0)
