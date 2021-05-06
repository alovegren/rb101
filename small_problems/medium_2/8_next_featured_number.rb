=begin

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

Problem
- Given an integer representing a 'featured number', return the next greatest featured number or an error message if one does not exist
- A featured number
  - is odd
  - is a multiple of 7
  - is a number with no repeating digits

- e.g. given 24...
  - 25 is not a multple of 7
  - 26 is even
  - 27 is not a multiple of 7
  - 28 is even
  - 29 is not a multiple of 7
  - 30 is even
  - 31 is not a multiple of 7
  - 32 is even
  - 33 has repeating digits
  - 34 is even
  - 35 is odd, a multiple of 7, and has no repeating digits therefore it is returned

Data structure
- Range

Algorithm
- Iterate from the given number plus one to 9_999_999_999
  - Return the current number if
    - It may be divided evenly by 7 (helper)
    - It is odd
    - The amount of its unique digits is the same as the amount of its digits (helper)
- Return an error message

=end

def divisible_by_7?(int)
  int % 7 == 0
end

def no_repeating_digits?(int)
  int.digits.size == int.digits.uniq.size
end

def featured(int)
  ((int + 1)..9_999_999_999).each do |num|
    next unless no_repeating_digits?(num)
    next unless divisible_by_7?(num)
    return num if num.odd?
  end
  'There is no possible number that fulfills those requirements'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) == 'There is no possible number that fulfills those requirements'