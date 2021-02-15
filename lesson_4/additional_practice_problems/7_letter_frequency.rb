# At this point we wonder with a start if we ought to have been using PEDAC for the practice problems in the past two assignments........

# Problem: Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# input: given string
# output: Hash, with a number of entries equal to the amount of unique letters used in the statement

# Create a hash whose keys are each unique letter in the sentence, and whose values are the corresponding frequencies of those letters in the sentence.

# Example: e.g. { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

# Data Structure: input is a string, output is a hash made of symbols and integers

# Algorithm
# -Create a hash
# -Call a method on statement which iterates through the letters in the sentence
# -If the current letter is already a key in the hash, increment its value by 1
# -Otherwise, add the current letter to the hash with a starting value of 1

# Let's code! We are thinking Enumerable#each_with_object will be a good method to use in this case.

statement.split('').each_with_object({}) do | (letter, frequency), hash |
  if hash.include?(letter)
    hash[letter] += 1
  else
    hash[letter] = 1
  end
end

# Our solution works, but it captures the white spaces as well.

# Exciting to see the LS solution is completely different from ours:

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# Instead of first producing a list of letters from the given statement, this solution creates an array of all of the letters in the alphabet (uppercase and lowercase, NOT including whitespace!)

# Then we iterate through the alphabet rather than through our statement.split('') array. For each letter, we assign a letter frequency using String#scan. Heading over to the Ruby documentation, we find the following signatures:

# scan(pattern) → array
# scan(pattern) {|match, ...| block } → str

# Both forms take an object argument, and one may be given a block. In the solution above, only the argument `pattern` is passed to the method, which is the letter within the alphabet on the current iteration. Every element of statement which matches letter will be added to a new returned array, and we store the value of the number of elements in that array within letter_fruquency. Finally, that value is saved into the result hash given that it is greater than zero.