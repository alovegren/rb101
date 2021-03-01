# # Problem: Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Input: An integer
# Output: A String

# # Rules
# Explicit Requirements:
# - The program should define a method which accepts one Integer argument representing a year
# - The method should return the corresponding century as an ordinal number

# Implicit Requirements:
# - We don't know whether negative numbers are valid, but will return them as years in BCE
# - We also don't know whether zero is a valid year within the problem, but we'll say it isn't
# - We assume no upper or lower bound for inputs

# # Examples/Test Cases:

# century(2000) == '20th'
# century(2001) == '21st'
# century(1965) == '20th'
# century(256) == '3rd'
# century(5) == '1st'
# century(10103) == '102nd'
# century(1052) == '11th'
# century(1127) == '12th'
# century(11201) == '113th'

# # Data Structure
# Main problems and approaches to solve within this problem:
# 1. Defining ranges that correspond to the correct centuries based on the input
# Let's think about the relationship between the range of years in a century and the number that represents that range:

# 1st century -> 1..100
# 2nd century -> 101..200
# 3rd century -> 201..300
# 4th century -> 301..400
# ...
# nth century -> (n - 99)..(n * 100)

# So given n, we can define a century. But how do we define n, given a number within that range? If we divide our input by 100, the amount of years in a century..

# 2001 / 100 = 20 (21st)
# 1965 / 100 = 19 (20th)
# 256 / 100 = 2 (3rd)
# 5 / 100 = 0 (1st)
# 10103 / 100 = 101 (102nd)

# We notice that for most of our inputs, we will get the correct century minus one, so we can generalize that to a rule EXCEPT for years that divide by 100 with no remainder:

# 2000 / 100 = 20 (20th)
# 100 / 100 = 1 (1st)

# When there is no remainder, division results the same century that we want. So we can build these two rules into our algorithm

# 2. Formatting the return string so it has the proper suffix

# We've encountered this problem before, and solved it by creating an array of ordinal numbers. Based on the last digit of the number we are adding a prefix to, we can access the number from the array

# The edge case to consider is the teens. If the last two digits are a number from 11 to 20, the suffix will be 'th' no matter what the last digit is.

# # Algorithm:
# - Define an ordinal number array as a constant
# - Define a method with one parameter
# - Find the remainder of the input divided by 100
# - If the remainder is zero,
#   - Assign the century as the number divided by 100
# - Otherwise,
#   - Assign the century as the number divided by 100, plus 1
# - Take the last digit of the input
#   - Output a string:
#     -Century - last digit + value of ordinal number array at the index of the last digit

ORDINAL_NUMBERS = %w(0th 1st 2nd 3rd 4th 5th 6th 7th 8th 9th)

def century(year)
  if year % 100 == 0
    century = year / 100
  else
    century = (year / 100) + 1
  end

  century_string = century.to_s
  if (century % 100) / 10 == 1 
    century_string += 'th'
  else
    century_string[-1] = ORDINAL_NUMBERS[century % 10]
  end
  century_string
end

# Reading over the Launch School solution, we note that our method is probably too complicated and should have been split into two methods.

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'