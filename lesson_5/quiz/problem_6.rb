a = 'hi'
english_greetings = ['hello', a, 'good morning']

# On line 1, we create a local variable `a` and set it equal to the string object 'hi'
# On line 2, we create a local variable `english_greetings` and set it equal to an array object containing two string elements and the object referenced by the variable `a`.

greetings = {
  french: ['bonjour', 'salut', 'allo'],
  english: english_greetings,
  italian: ['buongiorno', 'buonasera', 'ciao']
}

# On line 7, we create a loccal variable `greetings` and set it equal to a hash object. There are three key/value pairs in this hash. Each key is a symbol. Two of the values are arrays containing three strings each, and one of the values is the object referenced by the variable `english_greetings`.

greetings[:english][1] = 'hey'

# On line 15, we access the value associated with the key :english in the `greetings` hash, an array. We set the second element in that array equal to the string object 'hey'.

# We now expect our greetings hash to look like the following:

# greetings = {
#   french: ['bonjour', 'salut', 'allo'],
#   english: ['hello', 'hey', 'good morning'],
#   italian: ['buongiorno', 'buonasera', 'ciao']
# }

# And our `english_greetings` array:

# ['hello', 'hey', 'good morning']

# The object referenced by `a` is unchanged.

greetings.each do |language, greeting_list|
  greeting_list.each { |greeting| greeting.upcase! }
end

# On line 33, we iterate over each element contained in the `greetings` hash. On each iteration, we set the hash key equal to the local variable `language` and the corresponding array value to the local variable `greeting_list`. Then we iterate over each object in the collection `greeting_list` using #each. We set the current element of the iteration, a string object, equal to the local variable `greeting`. On each string object, we call the mutating #upcase!. We now expect our `greetings` hash to look like this:

# greetings = {
#   french: ['BONJOUR', 'SALUT', 'ALLO'],
#   english: ['HELLO', 'HEY', 'GOOD MORNING'],
#   italian: ['BUONGIORNO', 'BUONASERA', 'CIAO']
# }

puts a
# => 'hi'
puts english_greetings[1]
# => 'HEY'
puts greetings[:english][1]
# => 'HEY'