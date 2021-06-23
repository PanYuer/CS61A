' 1.3 Write two Scheme expressions that are equivalent to the following Python statement
'- one defining a function directly, and the other creating an anonymous lambda that
'is then bound to the name cat: cat = lambda meow, purr: meow + purr

(define cat (lambda (meow purr)(+ meow purr))
(define (cat meow purr) (+ meow purr))


' 1.4 Spot the bug(s). Test out the code and your xes in the scheme interpreter!
'(define (sum-every-other lst)
' (cond ((null? lst) lst)
'   (else (+ (cdr lst)
'       (sum-every-other (caar lst)) )))

(define (sum-every-other lst)
    (cond ((null? lst) 0)
        ((null? (cdr lst)) (car lst))
        (else (+ (car lst)
        (sum-every-other (cddr lst))))))


' 1.5 Define sixty-ones, a funcion that takes in a list and returns the number of times
' that 1 follows 6 in the list
(define (sixty-ones lst)
    (cond ((or (null? lst)(null? (cdr lst))) 0)
        ((and (= 6 (car lst)) (= 1 (cadr lst)))
        (+ 1 (sixty-ones (cddr lst))))
        (else (sixty-ones (cdr lst)))
    )
)

' 1.6 Define no-elevens, a function that takes in a number n, and returns a list of all
' distinct length-n lists of 1s and 6s that do not contain two consecutive 1s.
(define (no elevens n)
    (cond ((= 0 n) '(()) )
        ((= 1 n) '((6) (1)) )
        (else (append (add-to-all 6 (no-elevens (- n 1)))
                    (add-to-all 1 (add-to-all 6 (no-elevens (- n 2)))))
                    )
    )
)

' 1.7 Define remember, a function that takes in another zero-argument function f, and
' returns another function g.
(define remembered? #f)
(define remembered nil)
(lambda ()
    (if remember ?
        remember 
        (begin (set! remembered (f))
                (set! remembered? #t)
                remembered))
)