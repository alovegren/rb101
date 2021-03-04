# # Problem: Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.

# Input: Integer
# Output: Boolean

# Rules
# # Explicit
# - The program should define a method with one parameter
# - It can be assumed that the input will be a positive integer
# - The program should return a boolean value
# - The program should return true if the given integer is a leap year according to the Gregorian Calendar
# - Leap years occur every year evenly divisible by 4, with one exception
#   - The year is divisible by 100. There is also an exception to this exception:
#     - The year is divisible by 400
# # Implicit
# - There is no upper bound for the input

# # Examples: 

# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == false
# p leap_year?(1) == false
# p leap_year?(100) == false
# p leap_year?(400) == true

# # Algorithm
# - Define a method w/ one param
# - Return false unless integer is divisible by 4
# - Return true unless integer is divisible by 100
# - Return false unless integer is divisible by 400

def leap_year?(year)
  return false unless year % 4 == 0
  return true unless year % 100 == 0
  return false unless year % 400 == 0
  true
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# # Further Exploration

# The order in which you perform tests for a leap year calculation is important. For what years will leap_year? fail if you rewrite it as:

def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# Years divisible by 400 will fail, since they will all be caught by the first condition of the else statement

# Can you rewrite leap_year? to perform its tests in the opposite order of the above solution? That is, test whether the year is divisible by 4 first, then, if necessary, test whether it is divisible by 100, and finally, if necessary, test whether it is divisible by 400. Is this solution simpler or more complex than the original solution?

# Yes, this is how we solved the exercise. This approach does seem more complex since it tests for the most common case first. That means that for any given integer, it's more likely that more than one of our logic branches will be evaluated. 