; File:			ex1_9.scm
; Created on:	2017-08-12
; Ref: 			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html
; Description:	Each of the following two procedures defines a method for 
;				adding two positive integers in terms of the procedures inc, 
;				which increments its argument by 1, and dec, which decrements 
;				its argument by 1. 

(define (inc n) 
	(+ n 1))

(define (dec n)
	(- n 1))
	
(define (+ a b) 
	(if (= a 0)
		b
		(inc (+ (dec a) b))))
		
; suppose a = 4, b = 5
; substitution model illustration:
; (inc (+ (dec 4) 5))
; (inc (+ (- 4 1) 5))
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6)))
; (inc (inc 7))
; (inc 8)
; 9
; answer: the Scheme interpreter uses the linear recursive process to resolve this procedure
		
(define (+ a b)
	(if (= a 0)
		b
		(+ (dec a) (inc b))))
		
; suppose a = 4, b = 5 
; substitution model illustration:
; (+ (dec 4) (inc 5))
; (+ (- 4 1) (+ 5 1))
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9
; answer: the Scheme interpreter uses the linear iterative process to resolve this procedure
