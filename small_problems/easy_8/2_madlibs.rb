=begin

Mad libs are a simple game where you create a story template with blanks for words. You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

Example

Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!


=end

def get_input
  input = {}

  puts "Enter a noun:"
  input[:noun] = gets.chomp

  puts "Enter a verb:"
  input[:verb] = gets.chomp

  puts "Enter an adjective:"
  input[:adjective] = gets.chomp

  puts "Enter an adverb:"
  input[:adverb] = gets.chomp

  input
end

def madlibs
  input = get_input

  puts "Do you #{input[:verb]} your #{input[:adjective]} #{input[:noun]} #{input[:adverb]}? That's hilarious!"
end

madlibs