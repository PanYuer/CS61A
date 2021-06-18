' 4.1 Write a function that returns the factorial of a number.

(define (factorial x)
    (if (< x 2) 1 (* x (factorial (- x 1)))
    )
)


' 4.2 Write a function that returns the nth Fibonacci number.
(define (fib n)
    (if (<= n 1) n (+ (fib(- n 1)) (fib(- n 2)))
)


' 5.1 Write a function which takes two lists and concatenates them.
(define (my-append a b)
    (if (null? a) b (cons (car a) (my-append (cdr a) b)))
)
scm> (my-append '(1 2 3) '(2 3 4))
(1 2 3 2 3 4)


' 5.2 Write a function that takes an element x and a non-negative integer n, and returns 
'a list with x repeated n times.
(define (replicate x n)
    (if (= n 0) nil (con x (replicate x (- n 1))))
)
scm> (replicate 5 3)
(5 5 5)


' 5.3 A run-length encoding is a method of compressing a sequence of letters.
'Write a function that takes a compressed sequence and expands it into the original sequence.
(define (uncompress s)
    (if (null? s) 
        s 
        (my-append (replicate (car (car s)) (car (cdr (car s))) (uncompress (cdr s)))))
)

scm> (uncompress '((a 1) (b 2) (c 3)))
(a b b c c c)


' 6.1 Write a function that takes a procedure and applies it to every element in a given list.
(define (map fn list)
    (if (null? lst)
        nil
        (cons (fn (car lst)) (map fn (cdr lst)))
    )
)

scm> (map (lambda (x) (* x x)) '(1 2 3))
(1 4 9)


' 6.2 Fill in the following to complete an abstract tree data type:
(define (make-tree label branches) 
    (cons label branches)
)

(define (label tree) 
    (car tree)
)

(define (branches tree) 
    (cdr tree)
)

' 6.3 Using the abstract data type above, write a function that sums up the entries of a
'tree, assuming that the entries are all numbers.
(define (tree-sum tree)
    (+ (label tree) (sum (map tree-sum (branches tree))))
)

(define (sum lst)
    (if (null? lst) 0 (+ (car lst (sum (cdr lst)))))
)