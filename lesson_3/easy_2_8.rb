advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice("Few things in life are as important as ")

# The above returns the string given to it, *if* the string is contained in the original string object on which the method is called

puts advice

advice.slice!("Few things in life are as important as ")

# The above returns the same value but mutates the caller such that "house training your pet dragon" is its resulting value

puts advice

# We can make use of a range with the following, more programmatic solution:

advice.slice!(0, advice.index('house'))
