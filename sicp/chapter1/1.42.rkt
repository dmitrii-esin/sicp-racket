#lang racket/base

(require rackunit)

(define (inc n) (+ n 1))

(define (square n) (* n n))

(define (compose f g)
    (lambda (x) (f (g x))))

(define solution ((compose square inc) 6))

(check-equal? solution 49)