#lang racket/base

(require rackunit)

(define (inc n) (+ n 1))

(define (double f)
  (lambda (x) (f (f x))))

(define solution ((double inc) 1))

(check-equal? solution 3)