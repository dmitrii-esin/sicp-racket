#lang racket/base

(require rackunit)

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (square a) (* a 2))

(define solution1 (smallest-divisor 199))

(define solution2 (smallest-divisor 19999))

(check-equal? solution1 199)

(check-equal? solution2 7)