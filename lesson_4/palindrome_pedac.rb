# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

# input: string
# output: string (not the same object)
# rules:
#   Explicit requirements:
#     - Every palindrome in the string must be converted to uppercase. (Remember: a palindrome is a word that reads the same forwards and backward)
#     - Palindromes are case sensitive ("Dad" is not a palindrome)

#   Implicit requirements:
#     - The returned string shouldn't be the same string
#     - if the string is an empty string, the result should be an empty array