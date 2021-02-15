ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
sum = 0

ages.each { |_, age| sum += age }

puts "The sum of the Munster family ages is #{sum}!"