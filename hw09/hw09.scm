
; Tail recursion

(define (replicate x n)
  'YOUR-CODE-HERE
  (define (replicate-helper lst x n)
     (if (= n 0)
         lst
         (replicate-helper (append (list x) lst) x (- n 1))
         )
    )
    (replicate-helper nil x n)
  )

(define (accumulate combiner start n term)
  'YOUR-CODE-HERE
  (if (= n 0)
      start
      (combiner (term n) (accumulate combiner start (- n 1) term))
      )
)

(define (accumulate-tail combiner start n term)
  'YOUR-CODE-HERE
  (define (helper n acc)
        (if (= n 0)
            acc
            (helper (- n 1) (combiner acc (term n)))
        )
    )
    (helper n start)
)

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
    (begin
        (define (naturals n)
            (cons-stream n (naturals (+ n 1)))
        )
        (map-stream (lambda (x) (* 3 x)) (naturals 1))
    )
)


(define (nondecreastream s)
    'YOUR-CODE-HERE
    (if (null? s)
        nil
        (begin
            (define (rest) (nondecreastream (cdr-stream s)))
            (if (or (null? (cdr-stream s))
                    (> (car s) (car (cdr-stream s))))
                (cons-stream (list (car s)) (rest))
                (cons-stream (cons (car s) (car (rest)))
                          (cdr-stream (rest))
                )
            )
        )
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))