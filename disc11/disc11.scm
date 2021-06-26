' 1.1 Write a macro that takes an expression and returns a parameter-less lamba 
' procedure with the expression as its body

' With quasiquotes:
(define-macro (make-lambda expr)
    `(lambda () ,expr))

' With the list constructor:
(define-macro (make-lambda expr)
    (list 'lambda (list) expr))


' 1.2 Write a macro that takes an expression and a number n and repeats the expression n times.

(define-macro (repeat-n expr n)
    (cons 'begin (replicate expr (eval n))))


' 1.3 Write a macro that takes in two expressions and or's them together (applying short-
' circuiting rules).

(define-macro (or-macro expr1 expr2)
    `(let ((v1 ,expr1))
        (if v1 v1 ,expr2)))