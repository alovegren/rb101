# We're going to solve the problem using Enumerable#each_with_object:

# Data Structure
# #each_with_object can create a new array for us in which to store the running totals

# # Algorithm
# - Define a method with one parameter
# - Initialize a current total variable at 0
# - Call #each_with_object on the array given as an argument
#   - Pass a new array in as one argument
#   - Pass in a block
#     - Within the block, add the current element in the collection to the current total
#     - Add the current total as an element in the array
# - The new array will be returned by default

def running_total(given_arr)
  current_total = 0
  given_arr.each_with_object([]) do |num, totals_array|
    current_total += num
    totals_array << current_total
  end
end

p running_total([2, 5, 13])  == [2, 7, 20]
p running_total([14, 11, 7, 15, 20])  == [14, 25, 32, 47, 67]
p running_total([3])  == [3]
p running_total([])  == []
