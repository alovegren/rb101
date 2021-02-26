# # Problem: Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

# Input: Integer
# Output: Boolean

# # Rules:
# Explicit Requirements:
# - The program should define a method with one parameter
# - If the Integer argument passed to the method is a palindrome
#   - That is, it reads the same forwards and backwards
# - The method should return true
# - Otherwise the method should return false

# Implicit Requirements
# - We consider single Integers to be palindromes

# # Examples/Test Cases
# palindromic_number?(34543) == true
# palindromic_number?(123210) == false
# palindromic_number?(22) == true
# palindromic_number?(5) == true

# # Algorithm
# - Define one of the palindrome? methods we wrote in the past two exercises
# - Define a method with one parameter
# - Convert the passed argument to a string
# - Call palindrome? on the new string

def palindrome?(str)
  str == str.reverse
end

def palindromic_number?(int)
  integer_string = int.to_s
  palindrome?(integer_string)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true