# # Further Exploration
# Can you think of a situation in which a boolean xor method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the xor method. Think of some additional examples.

# Another example of a boolean xor method would perhaps be preventing two authorized users from accessing an account at the same time. One user or the other could be logged into the account, but not both.


# || and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?

# The xor method would perform short circuit evaluation. Since an expression cannot be truthy and falsey at the same time, a truthy value from the first half of the gate-- which contains an and operator-- would make another truthy value from the second half impossible.