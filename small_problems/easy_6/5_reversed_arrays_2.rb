=begin

Problem
Write a method which takes an array, and returns a new array with the elements reversed.

Input: Array
Output: Array

Rules
- Must not be destructive
- Must return reversed array
- Given a one-element array, return the same array
- Given an empty array, return an empty array

Algorithm
- Create a new array
- Create a loop
  - Add the last element of the original array to the new array,
  - Then the second-to-last,
  - Then the third-to-last... and so on
- Until all of the elements of the old array populate the new array
- Return the new array

=end

def reverse(arr)
  reversed_arr = []
  i = -1

  until reversed_arr.size == arr.size
    reversed_arr << arr[i]
    i -= 1
  end

  reversed_arr
end

def reverse(arr)
  arr.each_with_object([]) { |elem, new_arr| new_arr.unshift(elem) } 
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true