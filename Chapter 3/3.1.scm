(define (make-accumulator balance)
	(define (dispatch amount)
		(set! balance (+ balance amount))
		balance)
	dispatch)