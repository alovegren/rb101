require "pry"

# # Problem
# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

# Input: array
# Output: array

# # Rules
# Explicit
# - Define a method that accepts an array as its only argument
# - The method should return an array with the same number of elements:
#   - The first element of the new array will be the same
#   - The second and following elements will represent a running total as computed with the elements from the original array
#   - In other words, the program should sum the numbers in the array, and display the sum of the current iteration as new elements in the new array
# Implicit
# - When passed an empty array, the program should return an empty array
# - If given an array containing only one number, the program should return a copy of the original array

# # Test Cases

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# # Data Structure

# 2  =  2
# +
# 5  =  7
# +
# 13 = 20

# 14  =  14
# +
# 11  =  25
# +
# 7   =  32
# +
# 15  =  47
# +
# 20  =  67

# Reflecting that we need to keep track of the current total at each iteration, we think we can make use of #reject which will allow us to access the `memo` value, or accumulator value at each iteration.

# # Algorithm
# - Define a method with one parameter
# - Create a running total array containing only the first element of the given array
# - Call #reduce on the array given as an argument
#   - At each iteration, 
#   - Add the accumulator value to the running total array
#   - sum the current element with the accumulator value
#     - This needs to be last, because it will be the return value passed back to the method
# - Set the return value of the entire method equal to a grand total, and add that to the running_totals array if:
#   - The grand total is an Integer. (This is to take care of the edge case wherein an empty array is passed)
# - Return the completed running_totals array

def running_total(input_array)
  running_totals = []
  grand_total = input_array.reduce do |running_total, current_num|
                  running_totals << running_total
                  running_total + current_num
                end
  running_totals << grand_total if grand_total.is_a?(Integer)
  running_totals
end
 
p running_total([2, 5, 13])  == [2, 7, 20]
p running_total([14, 11, 7, 15, 20])  == [14, 25, 32, 47, 67]
p running_total([3])  == [3]
p running_total([])  == []

# Of course, the solution is ridiculously simple and elegant:

def running_total(array)
  sum = 0
  array.map { |value| sum += value }
end

# At least I got some practice with #inject! (This also happens to be one of the further exploration tasks)