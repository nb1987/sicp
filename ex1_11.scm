; File:			ex1_11.scm
; Date created:	2017-08-13
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html
; Description:	A function f is defined by the rule that f(n) = n if n<3 
;				and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3. 	
;				Write a procedure that computes f by means of a recursive process. 
;				Write a procedure that computes f by means of an iterative process.

; Recursive process 
; (f 7) = 142 
; (f 8) = 335 
; (f 20) = 10,771,211
; (f 30) = 61,354,575,194
; Runtime note: (f 20) was still instantaneous, but (f 30) took about 45 seconds to return 
(define (f n)
	(if (< n 3) 
		n 
		(+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))) 
	)
)

; Iterative process
; If your function definition contains a single recursive call then it can't 'branch out' 
(define (f-iter n)
	(define (step counter f1 f2 f3)
		(cond 
			((< n 3) n)
			((= counter n) (+ f1 f2 f3))
			(else (step (+ 1 counter) (+ f1 f2 f3) (* 2 f1) (/ (* 3 f2) 2)))
		)
	)
	(step 3 2 2 0)
)