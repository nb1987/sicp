; File:			ex1_7.scm
; Date created: 2017-08-12
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html
; Description: 	The good-enough? test used in computing square roots will not be 
;				very effective for finding the square roots of very small numbers. 
;				Also, in real computers, arithmetic operations are almost always performed 
;				with limited precision. This makes our test inadequate for very large numbers. 
;				Explain these statements, with examples showing how the test fails for small 
;				and large numbers. An alternative strategy for implementing good-enough? is 
;				to watch how guess changes from one iteration to the next and to stop when the 
;				change is a very small fraction of the guess. Design a square-root procedure that 
;				uses this kind of end test. Does this work better for small and large numbers?

(define (good-enough? prev-guess guess) 
	(< (abs (- prev-guess guess)) 0.001))
	
(define (improve guess x)
	(average guess (/ x guess)))
	
(define (average x y) 
	(/ (+ x y) 2))
	
(define (sqrt-iter prev-guess guess x)
	(if (good-enough? prev-guess guess) 
	guess
	(sqrt-iter guess (improve guess x) 
		x)))
		
(define (sqrt x) 
	(sqrt-iter 2.0 1.0 x))