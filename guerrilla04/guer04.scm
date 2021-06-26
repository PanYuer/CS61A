' 1.2 Tail recursively implement sum-satised-k which, given an input list lst, a 
' predicate procedure f which takes in one argument, and an integer k, will return the
' sum of the rst k elements that satisfy f. If there are not k such elements, return 0.

(define (sum-satisfied-k lst f k)
    (define (sum-helper lst k total)
        (cond
            ((= 0 k) total)
            ((null? lst) 0)
            ((f (car lst)) (sum-helper (cdr lst) (- k 1) (+ total (car lst))))
            (else (sum-helper (cdr lst) k total)))) 
    (sum-helper lst k 0)
)


' 1.3 Tail-recursively implement remove-range which, given one input list lst, and two
' nonnegative integers i and j, returns a new list containing the elements of lst except
' the ones from index i to index j. You may assume j > i, and j is less than the length
' of the list. (Hint: you may want to use the built-in append function)

(define (remove-range lst i j)
    (define (remove-tail lst index so-far)
        (cond
            ((> index j)
                (append so-far lst))
            ((>= index i)
                (remove-tail (cdr lst) (+ index 1) so-far))
            (else
                (remove-tail (cdr lst)
                    (+ index 1)
                    (append so-far (list (car lst))))))
    (remove-tail lst 0 nil))
)