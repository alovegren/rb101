munsters_description = "The Munsters are creepy in a good way."

munsters_array = munsters_description.split

munsters_array.each do |word|
  word.upcase!
  if word.downcase.start_with?('t') || word.downcase.start_with?('m')
    word[0] = word[0].downcase!
  end
end

puts munsters_array.join(' ')

# Or...

puts munsters_description.swapcase

# Outputs tHE mUNSTERS ARE CREEPY IN A GOOD WAY.

puts munsters_description.capitalize

# Outputs The munsters are creepy in a good way.

puts munsters_description.downcase

# Outputs the munsters are creepy in a good way.

puts munsters_description.upcase

# Outputs THE MUNSTERS ARE CREEPY IN A GOOD WAY.
