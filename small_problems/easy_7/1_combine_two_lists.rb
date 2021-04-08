=begin

P: Write a method that takes two Arrays as arguments, and returns a new Array which contains all of the elements of both given Arrays with the elements alternated.

Input: 2 Arrays
Output: 1 array

Rules: 
- Arrays may be assumed to have same num elements
- Repeating elements should be displayed in same qtys (ask interviewer)
- Elements must alternate between those from first arg and second

E:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

D: Arrays all the way

A
- Create new array
- Create counter = 0
- Start a loop
    - Add element at counter index of first arg
    - Add element at counter index of second arg
    - Increment counter
    - Break if counter is size of first arg
=end

def interleave(arr1, arr2)
  interleaved_arr = []
  i = 0

  loop do
    interleaved_arr << arr1[i]
    interleaved_arr << arr2[i]

    i += 1

    break if i >= arr1.size
  end

  interleaved_arr
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']