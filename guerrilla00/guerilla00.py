# 2.1 Which numbers will be printed after executing the following code?

n = 0
if n:
    print(1)
elif n < 2:
    print(2)
else:
    print(3)
print(4)

# 2.3 Define a function, count digits, which takes in an integer, n, and counts the number of digits in that number.


def count_digits(n):
    '''
        >>> count_digits(4)
        1
        >>> count_digits(12345678)
        8
        >>> count_digits(0)
        0
    '''
    count = 0
    while n > 0:
        count += 1
        n = n // 10
    return count


print(count_digits(12345678))


# 2.4 Define a function, count matches, which takes in two integers n and m, and counts the number of digits that match.
def count_matches(n, m):
    '''
        >>> count_matches(10, 30)
        1
        >>> count_matches(12345, 23456)
        0
        >>> count_matches(121212, 123123)
        2
        >>> count_matches(111, 11) # only one's place matches
        2
        >>> count_matches(101, 10) # no place matches
        0
    '''
    matches = 0
    while n > 0 and m > 0:
        if n % 10 == m % 10:
            matches += 1
        n, m = n // 10, m // 10
    return matches


print(count_matches(121212, 123123))


# 4.5 Write make skipper, which takes in a number n and outputs a function.
def make_skipper(n):
    """
        >>> a = make_skipper(2)
        >>> a(5)
        1
        3
        5
    """
    def skipper(x):
        for i in range(x + 1):
            if i % n != 0:
                print(i)
    return skipper


a = make_skipper(2)
a(5)
