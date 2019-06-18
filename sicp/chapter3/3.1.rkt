#lang racket/base

(require rackunit)

(define (make-accumulator acc)
 (let ((balance acc))
  (lambda (addition) (set! balance (+ addition acc))
    balance)))

(define createdAcc (make-accumulator 10))
(define solution1 (createdAcc 100))
(define solution2 (createdAcc 50))

(check-equal? solution1 110)
(check-equal? solution2 60)
