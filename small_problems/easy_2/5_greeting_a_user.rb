# # Problem: Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

# Input: a string
# Output: one of two string options

# # Rules
# Explicit requirements:
# - The program should prompt the user for input
# - If the user's input does not include an exclamation mark,
# - The program should output a string with one greeting type
# - - > Sentence case
# - If the user's input does include an exclamation mark,
# - The program should output a strring with a different greeting type
# - - > Upper case

# Implicit requirements:
# - The exclamation mark our program checks for should directly follow the user's name

# # Examples

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

# Algorithm
# - Prompt the user for their name
# - Store their name in a variable
#   - If there was an exclamation mark after the name 
#     - Remove the exclamation mark and upcase the name
#     - Greet the user in all caps
#   - Otherwise
#     - Greet the user in sentence case

puts ">> Hello. What is your name?"
name = gets.chop

if name =~ /!/
  name = name.chomp('!').upcase
  puts "HELLO, #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hi, #{name}."
end