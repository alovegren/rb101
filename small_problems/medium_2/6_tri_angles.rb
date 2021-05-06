=begin

Tri-Angles
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Problem
- Given three integers representing angles, return invalid if
  - Any of the angles is 0 or less
  - The sum of the angles is not 180
- Otherwise, return
  - right if any one of the angles is 90
  - acute if all three are less than 90
  - obtuse if any one is greater than 90

Data structure
- Array

Algorithm
- Define helper method for invalidity: pass in array of angles, return boolean
  - Return true if: any element of the array is zero OR the sum of the elements is not 180

Main method
- Create an array containing the three integer arguments
- Iterate through the angles
  - Return right if the current angle is 90
  - Return obtuse if the current angle is greater than 90
- Return acute
=end

def invalid?(arr)
  arr.include?(0) || arr.reduce(:+) != 180
end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if invalid?(angles)

  angles.each do |angle|
    return :right if angle == 90
    return :obtuse if angle >= 90
  end
  :acute
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
