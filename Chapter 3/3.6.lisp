(define initial-seed 200)
(define (rand-update-seed x)
	(random (expt 2 31)))

(define (random-init-seed)
	(rand-update-seed (rand-update-seed initial-seed)))

(define rand-seed
	(let ((x (random-init-seed)))
		(lambda (action)
			(cond ((eq? action 'generate)
				(set! x (rand-update-seed x))
				x)
				((eq? action 'reset)
					(lambda (new-send)
						(set! x (random-init-seed))
						(set! x (rand-update-seed x))
							x))))))