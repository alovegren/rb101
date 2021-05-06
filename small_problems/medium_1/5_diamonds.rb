=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Problem
- Given an odd integer n, output a diamond with n many rows
  -e.g. 5-> row 1:      *
            row 2:     ***
            row 3:    *****
            row 4:     ***
            row 5:      *
  - The number of asterisks in each row increases by 2 until the midpoint, at which point the numbers then decrease by 2

Data structure
- Range, string ('*')

Algorithm
- Determine the midpoint of the given number, e.g. 1-> 1, 3-> 2, 5 -> 3, 9 -> 5 using integer division and adding 1
- Initialize a local variable to 1, to represent the number of stars being output on each iteration
- Iterate from 1 to the midpoint, inclusive
  - Print the number of stars
  - Increment the number of stars by 2

- Iterate from the midpoint to 1, non-inclusive
  - Decrement the number of stars by 2
  - Print the number of stars

=end

def diamond(rows)
  midpoint = (rows / 2) + 1
  num_stars = 1
  
  (1...midpoint).each do |_row|
    puts ('*' * num_stars).center(rows) 
    num_stars += 2
  end

  (midpoint).downto(1).each do |_row|
    puts ('*' * num_stars).center(rows)
    num_stars -= 2
  end
end

diamond(1)

# *
puts '-----------'

diamond(3)

#  *
# ***
#  *
puts '-----------'

 diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *