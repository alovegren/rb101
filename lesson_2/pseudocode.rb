# a method that returns the sum of two integers
# a method that takes an array of strings, and returns a string that is all those strings concatenated together
# a method that takes an array of integers, and returns a new array with every other element

START

GET user input for first number
SET integer1 = user input

GET user input for second number
SET integer2 = user input

SET result = integer1 + integer 2

PRINT result
END

START

# Given an array of strings

SET array = given array
SET iterator = 0
SET long_string = ''


WHILE iterator <= length of original array
  SET current_string = value within array at space 'iterator'
  long_string += current_string
  iterator += 1
  long_string
END

END

# Given an array of integers

SET integer_array = given array of integers
SET iterator = 0

WHILE iterator <= integer_array length
  IF current integer at position 'iterator' in array is even
  map current integer to new array
  ELSE
  skip to next iteration
  END
END

