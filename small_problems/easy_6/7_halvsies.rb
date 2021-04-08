=begin

Problem
Write a method that returns two arrays which are the two halves of a given array.

Input: 1 array
Output: 2 arrays

Rules
- If an even number of elements are in the first array,
- Return two arrays of equal size
- Otherwise, return two arrays where the first array is one larger than the other
- In other words, place the middle element in the first array
- Given an empty array, return two empty arrays
- Given a one-element array, return the first array with the same element, and the second array empty

Examples
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

Algorithm
- Create a new array for the first half
- Create a new array for the second half
- Iterate through the elements in the given array, in reverse order
  - Unless the size of the second half is equal to the size of the original (integer) divided by 2,
    - Add the current element to the second half
  - Otherwise, 
    - Add the current element to the first half
  - Add the two arrays to an overarching array and return it

=end

def halvsies(arr)
  arr1 = []
  arr2 = []

  arr.reverse_each do |elem|
    unless arr2.size == (arr.size / 2)
      arr2 << elem
    else
      arr1 << elem
    end
  end

  [arr1.reverse, arr2.reverse]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# LS solution:

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

# On line 58, 2.0 must be used to force a float if we have an odd number of elements. If `array.size` was divided by 2, we would be using integer division, thereby losing any decimal remainder and an indication that our array had an odd number of elements.