#lang racket/base

(require rackunit)

(define (iterative-improove good-enough? improove)
   (lambda (x)
     (define (iter counter)
       (if (good-enough? counter)
        counter
        (iter (improove counter))))
     (iter x)))

(define solution ((iterative-improove (lambda (x) (> x 1000)) (lambda (x) (* x x))) 100))

(check-equal? solution 10000)