; File:			ex1_8.scm
; Date created: 2017-08-12
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-10.html
; Description: 	Newton's method for cube roots is based on the fact that if y is 
;				an approximation to the cube root of x, then a better approximation 
;				is given by the value
; 
; 		          ((x/y^2) + 2y) / 3
;
; 				Use this formula to implement a cube-root procedure analogous to the 
;				square-root procedure. 

(define (good-enough? prev-guess guess) 
	(< (abs (- prev-guess guess)) 0.001))
	
(define (improve guess x)
	(/ (+ (/ x (* guess guess)) (* 2 guess)) 3))
	
(define (cube-root-iter prev-guess guess x)
	(if (good-enough? prev-guess guess) 
	guess
	(cube-root-iter guess (improve guess x) 
		x)))
		
(define (cube-root x) 
	(cube-root-iter 2.0 1.0 x))