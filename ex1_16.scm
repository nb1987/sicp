; File:			ex1_16.scm
; Date created:	2017-08-16 
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2.2
; Description:	Design a procedure that evolves an iterative exponentiation process that uses 
;				successive squaring and uses a logarithmic number of steps, as does fast-expt. (
;				Hint: Using the observation that (b^(n/2))^2 = (b^2)^(n/2), keep, along with the exponent n 
;				and the base b, an additional state variable a, and define the state transformation 
;				in such a way that the product a * b^n is unchanged from state to state. At the 
;				beginning of the process a is taken to be 1, and the answer is given by the 
;				value of a at the end of the process. In general, the technique of defining an 
;				invariant quantity that remains unchanged from state to state is a powerful way to 
;				think about the design of iterative algorithms.)

(define (even? n)
	(= (remainder n 2) 0)
)

(define (fast-expt b n)
	(cond 
		((= n 0) 1)
		((even? n) (square (fast-expt b (/ n 2))))
		(else (* b (fast-expt b (- n 1))))
	)
)

; iterative process 
; use state variable a to keep track of current value 
(define (fast-expt-iter b n)
	(define (step b n a) 
		(cond 
			((= n 0) a)
			((even? n) (step (square b) (/ n 2) a))
			(else (step b (- n 1) (* a b)))
		)
	)
	(step b n 1)
)

; step(3, 8, 1)
; step(9, 4, 1)
; step(81, 2, 1)
; step(6561, 1, 1)
; step(6561, 0, 6561)
; 