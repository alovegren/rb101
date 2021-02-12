numbers = []

while numbers.length < 5
  numbers << (0..99).to_a.sample
end

puts numbers