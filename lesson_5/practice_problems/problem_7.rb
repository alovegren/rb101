# Given this code, what would be the final values of a and b? Try to work this out without running the code.

a = 2 # Local variable a is initialized with a value of 2
b = [5, 8] # Local variable b is initialized, referencing a two-element Array of Integers
arr = [a, b] # Local variable arr is initialized, referencing a two-element array whose elements point to the same values as a and b, respectively. We expect the current value of arr to be [2, [5, 8]]

arr[0] += 2 # We access the first element of arr and increment its value by 2, binding that first element to a new value of 4. We expect the current value of arr to be [4, [5, 8]]
arr[1][0] -= a # We reference the first element of the second element in arr: 5. Then we increment 5 by the value of a*-1. Because our reference of a to 2 changed to 4, we expect the result of this operation to be 1.

# Our final array should be [4, [1, 8]]
# a = 4
# b = [1, 8]

# Wrong!

a = 2 # Local variable a is initialized with a value of 2
b = [5, 8] # Local variable b is initialized, referencing a two-element Array of Integers
arr = [a, b] # Local variable arr is initialized, referencing a two-element array whose elements *contain references* to the same values as a and b, respectively. We expect the current value of arr to be [2, [5, 8]]

arr[0] += 2 # We access the first element of arr and bind it to another Integer, equal to the value of 2 + 2. We now expect arr to be [4, [5, 8]]
arr[1][0] -= a # We reference the first element of the second element in arr: 5. Then we increment 5 by the value of a*-1. *Here is where we messed up last time.* Never did we mutate a: it is not possible to mutate immutable objects through an array. So incrementing 5 by -a results in 3, because a is still 2. At this point we expect arr to be [2, [3, 8]]

# We've established that a would still be 2 at this point. b, however, has changed to [3, 8]. Since b references an array, and not an immutable object such as an integer, we have mutated b by altering its elements. We can consider that the object_id of b did not change, but the object_id of its first element did. 