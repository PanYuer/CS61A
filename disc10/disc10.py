# 2.2 Complete the implementation below to handle and expressions. You may assume
# the conditional operators (e.g. <, >, =, etc) have already been implemented for you.


def calc_eval(exp):
    if isinstance(exp, Pair):
        if exp.first == 'and':   # and expressions
            return eval_and(exp.rest)
        else:  # Call expressions
            return calc_apply(calc_eval(exp.first), list(exp.rest.map(calc_eval)))
    elif exp in OPERATORS:  # Names
        return OPERATORS[exp]
    else:  # Numbers
        return exp


def eval_and(operands):
    curr, val = operands, True
    while curr is not nil:
        val = calc_eval(curr.first)
        if val is False:
            return False
        curr = curr.rest
    return val

