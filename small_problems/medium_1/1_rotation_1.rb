=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Problem
- Given an array, return a new array where the element formerly in the first position is now in the last
- Order otherwise the same
- One element array -> same element in new array
- Input: array, return: new array

Data Structure
- Array

Algorithm
- Take the first element in the array and move to last position, without mutating

- Define method
  - Assign copy of argument to local variable
    - Remove my first element and save to a new variable
    - Concatenate the removed element to the end of the array
  
=end

def rotate_array(arr)
  new_arr = arr.dup
  
  last = new_arr.shift
  new_arr << last
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

=begin
Further Exploraton
Write a method that rotates a string instead of an array. Do the same thing for integers. You may use rotate_array from inside your new method.
=end

def rotate_string(str)
  rotate_array(str.chars).join
end

p rotate_string("emmers") == "mmerse"
p rotate_string("parrot") == "arrotp"

def rotate_digits(int)
  rotate_array(int.to_s.chars).join.to_i
end

p rotate_digits(1234) == 2341
p rotate_digits(12) == 21
p rotate_digits(0) == 0