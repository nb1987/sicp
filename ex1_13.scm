; File			ex1_13.scm
; Date created:	2017-08-13
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html
; Description:	Prove that Fib(n) is the closest integer to φ^n/√5, where φ = (1 + √5)/2. Hint: Let ψ = (1 - √5)/2. 
; 				Use induction and the definition of the Fibonacci numbers (see section 1.2.2) to prove that Fib(n) = (φ^n - ψ^n)/√5.
; 				Note: φ = phi and ψ = psi 

(define (fib n) 
	(cond 
		((= n 0) 0)
		((= n 1) 1)
		(else (+ (fib (- n 1)) (fib (- n 2)))))
)

(define phi 
	(/ (+ 1 (sqrt 5)) 2)
)

(define psi 
	(/ (- 1 (sqrt 5)) 2)
)

(define (binet n) 
	(/ (- (expt phi n) (expt psi n)) (sqrt 5))
)

(define (proof n)
	(= (fib n) (binet n))
)