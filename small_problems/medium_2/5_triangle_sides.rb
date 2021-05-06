=begin

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Problem
- Given three integers representing lengths of the sides of a triangle, return
  - :invalid if the lengths could not physically make up a triangle
    - invalid case 1: any of the lengths are 0
    - invalid case 2: the sum of the two shorter sides is less than or equal to the length of the longest side

  - If the triangle is valid, return:
  - :equilateral if all three integers are the same
  - :isosceles if 2/3 integers are the same
  - :scalene if all three integers are different

Data structure
- Array of lengths

Algorithm
- Create an array comprised of the three arguments
- Helper method: Return invalid if any element of the array is 0 or if the first two elements of the array, sorted, are less than or equal to the last
  - pass in array, output true if invalid false otherwise

- Return equilateral if there is one unique element in the array
- Return isosceles if there are two unique elements
- Return scalene if there are three unique elements

=end

def invalid?(arr)
  sorted_arr = arr.sort
  arr.any? { |length| length.zero? } || sorted_arr[0] + sorted_arr[1] <= sorted_arr[2]
end

def triangle(l1, l2, l3)
  lengths = [l1, l2, l3]
  return :invalid if invalid?(lengths)
  
  case lengths.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid