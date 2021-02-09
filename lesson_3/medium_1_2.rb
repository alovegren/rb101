# puts "the value of 40 + 2 is " + (40 + 2)

# We should see a type mismatch because we are trying to do string concatenation with a string and an integer. We could instead write

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"