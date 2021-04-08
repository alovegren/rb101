=begin

Write a method that combines two arrays.

Input: 2 arrays
Output: 1 array

Rules
- Excepting duplicates, all values of both arrays should be present in the new array

e.g.
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

Algorithm
- Create a new array for the merged elements
- Add arrays together
- Eliminate duplicates
=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]