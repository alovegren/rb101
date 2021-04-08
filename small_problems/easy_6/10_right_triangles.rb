require 'pry'
=begin

Problem
Display a right triangle whose sides each have n stars, where n is the argument to a method.

Input: Integer
Output: Strings (formatted nicely)

Rules
- The triangle's hypotenuse should be facing the left side of the terminal
- The stars should be on continuous lines

Examples

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

Algorithm
 - Iterate through all values from 1 to n
  - Print the current number of stars, padded with space such that the length of the string is n

=end

def padded_star_string(current_n, total_n)
  ('*' * current_n).rjust(total_n)
end

def triangle(n, up_down = 'up')
  up_down == 'up' ? (start, stop = 1, n) : (start, stop = n, 1)
  binding.pry
  (start..stop).each do |i|
    binding.pry
    puts padded_star_string(i, n)
  end
end

# triangle(3)
# triangle(5)
# triangle(9)

triangle(3, 'down')
triangle(5, 'down')
triangle(9, 'down')


# Further Exploration

# Print triangle upside down
#  - Count down instead of up
