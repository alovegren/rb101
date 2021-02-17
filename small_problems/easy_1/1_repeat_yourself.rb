require 'pry'

# Problem: Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

# Example:

# repeat('Hello', 3) => Hello
                      # Hello
                      # Hello

# Input: Two arguments: a string and a positive Integer
#   -The method will repeat the string Integer times
#   -Integer must be >= 1 since zero is neither positive nor negative

# Output: Integer many strings
#   -They should be printed to the screen with a newline character after each repetition

# Explicit requirements:
#   -A method definition with two arguments, a string and a positive integer
#   -This method must repeat the string Integer many times

# Implicit requirements:
#   -We need not validate the data beforehand, but it could be a bonus step
#   -The Integer should be non-zero

# Data Structure: Strings and an integer, no need for either to be stored in a collection.

# Algorithm
  # -Define a method which accepts two parameters
  # -Given that the parameters are a string and an integer,
  # -Print the string integer many times to the screen


def repeat(string, integer)
  i = 0
  while i < integer
    puts string
    i += 1
  end
end

puts repeat('Nub is on the kitchen counter', 10)
puts repeat('When I was a young warthog', 2)
puts "=================================="

# Initial mistakes: using Integer#times inside the method definition. Since #times returns itself, integers counting up to `Integer` were printed to the screen instead.

# When converting to a while loop, we initialized i outside of the method definition, causing a NameError. Local variables are not accessible within method definitions unless they are passed in as variables. Since the counter here did not relate to anything outside of the method definition, we initialize it before the while loop.

# We see the solution used the #times method so we want to see the differences between our try and theirs. Ours:

def repeat(string, number)
  number.times { |string| puts string }
  binding.pry
end

puts repeat('Nub is on the kitchen counter', 10)
puts repeat('When I was a young warthog', 2)
puts "=================================="

# Theirs:

def repeat(string, number)
  number.times do
    puts string
  end
end

puts repeat('Nub is on the kitchen counter', 10)
puts repeat('When I was a young warthog', 2)

# Consulting the ruby documentation for Integer#times, we see that by passing in `string` as a parameter to the block within the method, we are accidentally referencing the integer on which the method was called. The method signature reads: 

# times {|i| block } → self

# where `i` represents the integer passed in. So we need not use a parameter within the block.