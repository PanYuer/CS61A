# 1.1 Write a function count_stair_ways that solves this problem.
# Assume n is positive.


def count_stair_ways(n):
    if n == 1:
        return 1
    elif n == 2:
        return 2
    else:
        return count_stair_ways(n - 1) + count_stair_ways(n - 2)


print(count_stair_ways(10))
print(count_stair_ways(15))


# 1.2 Write a function count_k that figures out the number
# of paths for this sce- nario. Assume n and k are positive.

def count_k(n, k):
    if n == 0:
        return 1
    elif n < 0:
        return 0
    else:
        total = 0
        for i in range(1, k + 1):
            total += count_k(n - i, k)
        return total


print(count_k(3, 3))
print(count_k(4, 4))
print(count_k(10, 3))
print(count_k(300, 1))


# 2.1 What would Python display?
a = [1, 5, 4, [2, 3], 3]
print(a[0], a[-1])
print(len(a))
print(2 in a)
print(4 in a)
print(a[3][0])


# 2.2 Write a function that takes a list and returns a new list that
# keeps only the even-indexed elements of lst and multiplies them by
# their corresponding index.
def even_weighted(lst):
    """
    >>> x = [1, 2, 3, 4, 5, 6]
    >>> even_weighted(x)
    [0, 6, 20]
    """
    return [lst[i] * i for i in range(len(lst)) if i % 2 == 0]


x = [1, 2, 3, 4, 5, 6]
print(even_weighted(x))


# 2.3 Write a function that takes in a list and returns the maximum
# product that can be formed using nonconsecutive elements of the list.
def max_product(lst):
    """Return the maximum product that can be formed using lst without 
    using any consecutive numbers
    >>> max_product([10,3,1,9,2]) # 10 * 9
    90
    >>> max_product([5,10,5,10,5]) # 5 * 5 * 5
    125
    >>> max_product([])
    1
    """
    if lst == []:
        return 1
    elif len(lst) == 1:
        return lst[0]
    else:
        return max(max_product(lst[1:]), lst[0] * max_product(lst[2:]))


print(max_product([10, 3, 1, 9, 2]))
print(max_product([5, 10, 5, 10, 5]))
print(max_product([]))
