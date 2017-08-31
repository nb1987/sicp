; File:			ex1_18.scm
; Date created:	2017-08-17 
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2.2
; Description:	Using the results of exercises 1.16 and 1.17, devise a procedure that generates 
;				an iterative process for multiplying two integers in terms of adding, doubling, 
;				and halving and uses a logarithmic number of steps


; fast-multi recursive call stack 
; 3 8 
; double (* 3 4) = double 12 = 12 + 12 = 24
; double (* 3 2) = double 6 = 6 + 6 = 12
; double (* 3 1) = double 3 = 3 + 3 = 6 
; + 3 (* 3 0)    = + 3 0 = 3
; 0

; recursive process (from exercise 1.17)
(define (fast-multi a b)
	(cond
		((= b 0) 0)
		((not (even? b)) (+ a (fast-multi a (- b 1))))
		(else (double (fast-multi a (halve b))))
	)
)

(define (fast-multi-iter a b)
	(define (step a b tot)
		(cond
			((= b 0) tot)
			((not (even? b)) (step a (- b 1) (+ tot a)))
			(else (step a (halve b) (+ tot (* (halve b) a))))
		)
	)
	(step a b 0)
)
	
(define (double n)
	(+ n n)
)

(define (halve n)
	(/ n 2)
)

(define (even? n)
	(= 0 (remainder n 2))
)	