=begin

Problem: Given an array, write a method that returns the same array but with its elements reversed.

Input: Array
Output: Same array, mutated

Rules
- The elements of the array should be in the reverse order
- Given an empty array, return an empty array
- The array should be reversed in place
- Given a one-element array, return the same array

Examples
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

Data Structure

  [1, 2, 3, 4]

  [4, 3, 2, 1]

  var = 2 (idx 1)
  delete 2
  arr.unshift(2) => [2, 1, 3, 4]

  var = 3 (idx 2)
  delete 3
  arr.unshift(3) => [3, 2, 1, 4]

  var = 4 (idx 3)
  delete 4
  arr.unshift(4) => [4, 3, 2, 1]

Algorithm
- Iterate through the array
- Start index at 1
  - Until index is length of array
  - Remove element at index and add to beginning of array
  - Add 1 to index

=end

def reverse!(arr)
  index = 1

  until index >= arr.size
    current_num = arr.delete(arr[index])
    arr.unshift(current_num)
    index += 1
  end

  arr
end

list = [1,2,3,4]
result = reverse!(list)
p result  == [4, 3, 2, 1] # true
p list  == [4, 3, 2, 1] # true
p list.object_id  == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true