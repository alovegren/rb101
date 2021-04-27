=begin
Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

Problem
- Given a positive integer, return an integer whose digits are the reverse of the given number.
  - e.g. 456 -> 654
- Disregard leading zeros in input; don't have to be translated to trailing zeros in output
  - e.g. 100 -> 1

Data structure
- Integer -> array of strings -> string -> integer

Algorithm
- Convert integer into string, reverse string, convert to integer

=end

def reversed_number(int)
  int.to_s.reverse.to_i
end

p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1