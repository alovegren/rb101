# # Problem: Write a program that will ask a user for an input of a word or multiple words and give back the number of characters. Spaces should not be counted as a character.

# Input: String
# Output: Integer, output as a string

# # Rules
# Explicit requirements:
# - Should prompt the user for a 'word' or 'multiple word' input (string)
# - Should return the number of characters of the word or words
# - Spaces should not be counted

# Implicit requirements:
# - Data should be validated, since other problems in these exercises instruct us not to worry about them
#   - What isn't valid?
#     - Numbers (Integers, floats)
#     - Empty strings
# - The return output should be interpolated in a string
# - The prompts should be printed, not puts (user input on same line as prompt)

# # Examples

# Please write word or multiple words: walk
# => There are 4 characters in "walk".

# Please write word or multiple words: walk, don't run
# => There are 13 characters in "walk, don't run".

# # Algorithm
# - Initialize user input variable
# - Start validation loop
#   - Prompt the user for input
#   - Save input
#   - Break if
#     - The input converted to an integer, then back to a string, is not equal to the original input
#     - The input converted to an float, then back to a string, is not equal to the original input
#     - The size of the input is greater than zero
#   - Print an error message and ask for input again.
loop do
  user_input = ''

  loop do
    print "Please write a word or multiple words: "
    user_input = gets.chomp
    break if user_input.to_i.to_s != user_input &&
            user_input.to_f.to_s != user_input &&
            user_input.size > 0
    puts "Invalid input."
  end

  # Join the input characters together, removing whitespace
  # Save the size of the joined characters to a size variable
  # Output the size variable,
  # - Interpolated within an output string,
  # - Which also reminds the user what their original string was

  user_input_size_string = user_input.split.join.size.to_s
  puts "There are #{user_input_size_string} characters in \"#{user_input}\"."

  # Wrap the whole program in a loop and ask if user wants to play again. (For easier testing)

  puts "Do you want to play again? y or n"
  play_choice = gets.chomp
  break if play_choice == 'n'
end

puts "Thanks for playing!"