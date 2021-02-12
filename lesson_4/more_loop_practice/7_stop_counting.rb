5.times do |index|
  puts index
  break if index == 2
end

puts '======================================'

# The following will run 5 times

5.times do |index|
  puts index
  break if index == 4
end

puts '======================================'

# The following will run 1 time

5.times do |index|
  puts index
  break if index < 7
end