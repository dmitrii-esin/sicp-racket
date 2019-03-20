#lang racket/base

(require rackunit)

;;; f(n)
;;; n < 3  => n
;;; n >= 3 => f(n) = f(n − 1) + f(n − 2) + f(n − 3)

(define (fib-recursive n)
  (if (< n 3)
      n 
        (+ (fib-recursive (- n 1)) (fib-recursive (- n 2)) (fib-recursive (- n 3)))))

(define (fib-iter n)
    (iter 2 1 0 n))
(define (iter a b c counter)
    (if (= counter 0)
     c
     (iter (+ a b c) a b (- counter 1))))

(define solution1 (fib-recursive 1))
(define solution2 (fib-recursive 33))
(define solution3 (fib-iter 40))

(check-equal? solution1 1)
(check-equal? solution2 280947697)
(check-equal? solution3 20006521300)