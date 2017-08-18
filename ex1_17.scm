; File:			ex1_17.scm
; Date created:	2017-08-17 
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2.2
; Description:	The exponentiation algorithms in this section are based on performing exponentiation by means 
;				of repeated multiplication. In a similar way, one can perform integer multiplication by means of 
;				repeated addition. The following multiplication procedure (in which it is assumed that our language 
;				can only add, not multiply) is analogous to the expt procedure:
;				
;				(define (* a b)
;				  (if (= b 0)
;					  0
;					  (+ a (* a (- b 1)))))
;					  
;				This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, 
;				operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, 
;				design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.


; * recursive call stack
;  3 8
; + 3 (* 3 7) = + 3 21 = 24
; + 3 (* 3 6) = + 3 18 = 21
; + 3 (* 3 5) = + 3 15 = 18
; + 3 (* 3 4) = + 3 12 = 15
; + 3 (* 3 3) = + 3 9 = 12
; + 3 (* 3 2) = + 3 6 = 9
; + 3 (* 3 1) = + 3 3 = 6
; + 3 (* 3 0) = + 3 0 = 3
; 0

; fast-multi recursive call stack 
; * 3 8 
; double (* 3 4) = double 12 = 12 + 12 = 24
; double (* 3 2) = double 6 = 6 + 6 = 12
; double (* 3 1) = double 3 = 3 + 3 = 6 
; + 3 (* 3 0)    = + 3 0 = 3
; 0


(define (* a b)
	(if (= b 0) 0
	(+ a (* a (- b 1)))))
	
(define (fast-multi a b)
	(cond
		((= b 0) 0)
		((not (even? b)) (+ a (fast-multi a (- b 1))))
		(else (double (fast-multi a (halve b))))
	)
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