# 1.2 Write a function that takes in no arguments and returns two functions,
# prepend and get, which represent the \add to front of list" and \get the ith item"
# operations,respectively.


def nonlocalist():
    """
    >>> prepend, get = nonlocalist()
    >>> prepend(2)
    >>> prepend(3)
    >>> prepend(4)
    >>> get(0)
    4
    >>> get(1)
    3
    >>> get(2)
    2
    >>> prepend(8)
    >>> get(2)
    3
    """
    def get(x): return "Index out of range!"

    def prepend(value):
        nonlocal get
        f = get

        def get(i):
            if i == 0:
                return value
            return f(i - 1)
    return prepend, lambda x: get(x)


# 2.2 We now want to write three dierent classes, Server, Client, and Email to
# simulate email.
class Email:
    """Every email object has 3 instance attributes: the
    message, the sender name, and the recipient name.
    """

    def __init__(self, msg, sender_name, recipient_name):
        self.msdg = msg
        self.sender_name = sender_name
        self.recipient_name = recipient_name


class Server:
    """Each Server has an instance attribute clients, which
    is a dictionary that associates client names with
    client objects.
    """

    def __init__(self):
        self.clients = {}

    def send(self, email):
        """Take an email and put it in the inbox of the client
        it is addressed to.
        """
        client = self.client[email.recipient_name]
        client.receive(email)

    def register_client(self, client, client_name):
        """Takes a client object and client_name and adds it
        to the clients instance attribute.
        """
        self.clients[client_name] = client


class Client:
    """Every Client has instance attributes name (which is
    used for addressing emails to the client), server
    (which is used to send emails out to other clients), and
    inbox (a list of all emails the client has received).
    """

    def __init__(self, server, name):
        self.inbox = []
        self.server = server
        self.name = name
        self.server.register_client(self, self.name)

    def compose(self, msg, recipient_name):
        """Send an email with the given message msg to the
        given recipient client.
        """
        email = Email(msg, self.name, recipient_name)
        self.server.send(email)

    def receive(self, email):
        """Take an email and add it to the inbox of this client."""
        self.inbox.append(email)

# 3.1 Below is a skeleton for the Cat class, which inherits from the Pet class.
# To complete the implementation, override the init and talk methods and add a new
# lose_life method.


class Cat(Pet):
    def __init__(self, name, owner, lives=9):
    Pet.__init__(self, name, owner)
    self.lives = lives

    def talk(self):
        """ Print out a cat's greeting.
        >>> Cat('Thomas', 'Tammy').talk()
        Thomas says meow!
        """
        print(self.name + ' says meow!')

    def lose_life(self):
        """Decrements a cat's life by 1. When lives reaches zero, 'is_alive'
        becomes False.
        """
        if self.lives > 0:
            self.lives -= 1
            if self.lives == 0:
                self.is_alive = False
        else:
            print("This cat has no more lives to lose :(")


# 3.2 More cats! Fill in this implemention of a class called NoisyCat, which is just
# like a normal Cat. However, NoisyCat talks a lot { twice as much as a regular Cat!
class NoisyCat(Cat):
    """A Cat that repeats things twice."""

    def __init__(self, name, owner, lives=9):
        # Is this method necessary? Why or why not?
        Cat.__init__(self, name, owner, lives)
        # this method is not necessary because NoisyCat already inherits Cat's init method

    def talk(self):
        """Talks twice as much as a regular cat.
        >>> NoisyCat('Magic', 'James').talk()
        Magic says meow!
        Magic says meow!
        """
        Cat.talk(self)
        Cat.talk(self)
