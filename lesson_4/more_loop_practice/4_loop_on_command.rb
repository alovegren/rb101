loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
  puts "I should remember to put an error message here. Please type 'yes'"
end