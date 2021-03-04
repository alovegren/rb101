# # Problem: Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples. For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# Input: integer
# Output: integer

# # Rules
# Explicit
# - Define a method with one parameter
# - Output a sum:
#   - The sum is computed from the sequence of all integers who are multiples of 3 or 5 that lie between 1 and the integer passed as an argument
# - We assume the argument passed is an integer greater than 1

# # Test Cases

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# # Algorithm
# - Define a method with one parameter
# - Create an empty array in which to store multiples of 3 or 5
# - Begin a loop with a range from 1 to the passed argument
# - Add the current value of the range to the multiples array if:
#   - The current value is divisible by 3 or 5
# - Sum the values held in the multiples array

def multisum(upper)
  multiples = []

  for i in 1..upper
    multiples << i if i % 3 == 0 || i % 5 == 0
  end

  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168