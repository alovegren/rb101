=begin
Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

Problem
- Given a first and last name as a single string, return the name in the following format:
  - Last name, first name
- Input: string, return: new string
- e.g. Audrey Lovegren -> Lovegren, Audrey

Data structure
- Strings
- Array of words

Algorithm
- Break string into array of words
- Assign first word to the first name and last word to the last name

- Return the first and last names in the proper format using string interpolation

=end

def swap_name(string)
  names = string.split
  first_name = names[0]
  last_name = names[1]

  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'