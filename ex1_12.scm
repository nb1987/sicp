; File:			ex1_12.scm
; Date created:	2017-08-13 
; Ref:			https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-11.html
; Description: The following pattern of numbers is called Pascal's triangle.
;
;		1
;	   1 1
;     1 2 1
;    1 3 3 1
;   1 4 6 4 1
;
; The numbers at the edge of the triangle are all 1, and each number inside the triangle 
; is the sum of the two numbers above it. Write a procedure that computes elements of Pascal's triangle 
; by means of a recursive process.

(define (pascal row col)
	; let row define the base of your triangle; you have no need to look beyond that 
	(cond 
		((> col row) #f)
		((or (= col 1) (= col row)) 1)
		(else (+ (pascal (- row 1) col) (pascal (- row 1) (- col 1))))
	)
)

;       (pascal 3 2)
;            /\
; (pascal 2 2) (pascal 2 1)
;
;
;                    (pascal 5 3)
;                         /\
;              (pascal 4 3) (pascal 4 2)
;                  /\                 /\
;         (pas 3 3) (pas 3 2) (pas 3 2)  (pas 3 1)  
;             1        /\            /\         1
;               (p 2 2) (p 2 1) (p 2 2) (p 2 1)
;                  1        1      1       1