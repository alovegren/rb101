=begin

Problem
Write a method that accepts an array and an Integer search value. Return true if the search value exists in the array. Otherwise, return false.

Input: Two arguments: array, integer
Output: Boolean

Rules
- Given an empty array, return false
- May not use #include?
- Return a true boolean
- edge case: nil as (valid) search value 

Examples
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

Algorithm
- Iterate through array
- Return true if current element equals target value
- Otherwise, return false

=end

def include?(arr, target_value)
  verdict = false

  arr.each do |elem|
    verdict = true if elem == target_value
  end

  verdict
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# Further Exploration

def alt_include?(arr, target_value)
  new_arr = arr.select { |elem| elem == target_value }

  return false if new_arr.empty?
  true
end

p alt_include?([1,2,3,4,5], 3) == true
p alt_include?([1,2,3,4,5], 6) == false
p alt_include?([], 3) == false
p alt_include?([nil], nil) == true
p alt_include?([], nil) == false