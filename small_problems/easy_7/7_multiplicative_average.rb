=begin
Write a method that takes an Array of integers as input, multiplies all the numbers together, divides the result by the number of entries in the Array, and then prints the result rounded to 3 decimal places. Assume the array is non-empty.

Problem
- Given an array of integers, return a float which is the result of taking a multiplicative average of the array
  - That is, multiplying all of the numbers in the array together and then dividing by the number of entries
- Output the result rounded to 3 decimal places

Algorithm
- Iterate through, multiplying the first index by the second by the third.. and so on, until the end of the array
- Divide the float by the array size, then round to three decimal places
- Print the result
=end

def show_multiplicative_average(arr)
  product = arr.inject(&:*)
  average = format("%.3f", (product.to_f / arr.size))

  puts "The result is #{average}"
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667