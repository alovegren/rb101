=begin

Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

Problem
- Given a positive number, return the number times -1
- Given a negative number or 0, return the same number

Examples
- 142 -> -142
- -142 -> -142
- 0 -> 0

Data Structure
- Integers (floats would work fine)

Algorithm
- Check whether number is greater than 0
  - If so, return it times -1
  - Otherwise, return the same number
=end

def negative(int)
  int > 0 ? int * -1 : int
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby