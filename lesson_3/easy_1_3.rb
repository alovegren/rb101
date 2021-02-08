advice = "Few things in life are as important as house training your pet dinosaur."

advice_array = advice.split
advice_array[6] = "urgent"
advice = advice_array.join(" ")

print advice

# Or.........

advice.gsub!('important', 'urgent')