#lang racket/base

(require rackunit)

(define (sqrt n) (* n n n)

; 1
(define (iterative-improove good-enough? improove)
    (lambda (x) 
        (if (good-enough? x)
         x
         ((iterative-improove good-enough? improove) (improove x)))))

; 2
 (define (iterative-improove good-enough? improove)
    (lambda (x)
      (define (iter counter)
        (if (good-enough? counter)
        counter
        (iter (improove counter))))
  (iter x))))

(define solution ((iterative-improove (lambda (x) (= x 64)) (lambda (x) (* x x))) 4))

(check-equal? solution 64)