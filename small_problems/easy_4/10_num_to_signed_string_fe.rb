require "pry"
# Problem: Refactor our solution to reduce the 3 integer_to_string calls to just one.

# First, we're going to refactor our own solution.
# - Remove +/- functionality from the signed_integer_to_string method
#   - This functionality probably makes our method too long

DIGITS = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(int)
  final_str = ''
  current_num = int

  loop do
    current_num, remainder = current_num.divmod(10)
    # binding.pry
    final_str.prepend(DIGITS[remainder])
    break if current_num == 0
  end
  final_str
end

# Package the +/- functionality into a new method, calling signed_integer_to_string only once
# # We still need to check the three cases of int <=> 0, but we can package the results of those checks into a multiplier variable (referencing a string). Then, we can call the integer_to_string method and combine its results with our multiplier.
# - Retain case statement, but set multiplier equal to '-', '+' or an empty string depending on the three cases
# - Multiply int * -1 on the first condition
# - Return the multiplier variable string plus a call to integer_to_string

def signed_integer_to_string(int)
  case int <=> 0
  when -1 then multiplier = '-'
    int *= -1
  when 1 then multiplier = '+'
  else multiplier = ''
  end

  multiplier + integer_to_string(int)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'