require "pry"

VALID_CHOICES = %w(rock paper scissors lizard spock)
valid_choice_letter = {
  r: "rock",
  p: "paper",
  s: "scissors",
  l: "lizard",
  sp: "spock"
}

def prompt(message)
  puts "=> #{message}"
end

winning_values = {
  rock: %w(scissors lizard),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(paper spock),
  spock: %w(rock scissors)
}

def win?(values, first, second)
  (values[first.to_sym][0] == second) || 
  (values[first.to_sym][1] == second)
end

def display_results(rpsls_values, player, computer)
  if win?(rpsls_values, player, computer)
    prompt("You won!")
  elsif win?(rpsls_values, computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  user_score = 0
  computer_score = 0
  loop do
    break if user_score == 5 || computer_score == 5

    choice = ''
    
    loop do
      prompt("Choose one: rock (r), paper (p), scissors (s), lizard (l), spock (sp)")
      letter_choice = gets.chomp.downcase
      choice = valid_choice_letter[letter_choice.to_sym]

      if VALID_CHOICES.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}; computer chose #{computer_choice}.")

    display_results(winning_values, choice, computer_choice)

    if win?(winning_values, choice, computer_choice)
      user_score += 1
    else
      computer_score += 1
    end

    prompt("Your score is #{user_score}. Computer's score is #{computer_score}")

  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for playing. Good bye!")
