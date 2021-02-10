greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'
puts greetings

# The variable 'greetings' is first initiated with a hash value. Then we initiate 'informal_greeting' and point that variable to the value 'hi' corresponding to the hash key :a

# We then mutate the String caller stored in informal_greeting by using '<<' on informal_greeting. This also changes the String object stored within :a's value inside the hash.

# So we expect to see { :a => 'hi there'} output from the program