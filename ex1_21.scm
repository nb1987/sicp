; File:			ex1_21.scm
; Date created:	2017-09-10
; Description: 	Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

(define (smallest-divisor n)
	(find-divisor n 2)
)

(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
		  ((divides? test-divisor n) test-divisor)
		  (else (find-divisor n (+ test-divisor 1))))
)

(define (divides? a b)
	(= (remainder b a) 0)
)

; (smallest-visior 199) 
; 199
; (smallest-visior 1999) 
; 1999
; (smallest-visior 19999) 
; 7