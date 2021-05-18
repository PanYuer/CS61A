def cake():
    print('beets')

    def pie():
        print('sweets')
        return 'cake'
    return pie


chocolate = cake()
print(chocolate)
print(chocolate())
more_chocolate, more_cake = chocolate(), cake
print(more_chocolate)


def snake(x, y):
    if cake == more_cake:
        return lambda: x + y
    else:
        return x + y


print(snake(10, 20))
print(snake(10, 20)())
cake = 'cake'
print(snake(10, 20))
