=begin
Write a method that can rotate the last n digits of a number.

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

Problem
- Given an integer and some other integer n, rotate the last n digits of the first integer
  -e.g. 3567, 3 -> 3  [5  6  7] -> 3  [6  7  5] -> 3675
                   ^
      3 is left alone since we're only working with the last 3 digits
- Input: 2 integers, return 1 integer
- rotate_array from previous exercise may be used

Data structure
- Digits to string to array back to string, digits

Algorithm
- Convert the first integer to a string and then array of the string's chars
- Invoke the rotate_array method on a slice of the new array that is n chars long, ending with the last element in the array
- Reassign the last n chars to the result of the method
- Join the array back together and convert it to an integer

=end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(starting_num, n)
  digits_arr = starting_num.to_s.chars
  start_slice = -n

  digits_arr[start_slice..-1] = rotate_array(digits_arr[start_slice..-1])
  digits_arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917