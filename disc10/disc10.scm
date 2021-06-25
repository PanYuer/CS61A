
' 3.2 Write a tail recursive function that takes in a Scheme list and returns
' the numerical sum of all values in the list.
(define(sum lst)
    (define(sum-sofar lst current-sum)
        (if (null? lst)
            current-sum
            (sum-sofar(cdr lst)(+ (car lst) current-sum))))
    (sum-sofar lst 0))

'3.3 Write a tail recursive function that returns the nth bonacci number. We define
' b(0) = 0 and b(1) = 1.
(define(fib n)
    (define(fib-sofar i curr next)
        (if (=i n)
            curr
            (fib-sofar(+ i 1) next(+ curr next)))
    (fib-sofar 0 0 1))
