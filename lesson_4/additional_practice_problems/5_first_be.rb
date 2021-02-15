# In the following array, Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles Belle)

# We locate the Array#index method and find that it can accept an object argument, a block argument, or no argument (with which it will return a new enumerator)

# In the first two cases described above, #index returns the Integer representing the index of the first element for which the block returns a truthy value.

flintstones.index { |name| name.start_with?('Be') }

# (To test that we only get one value, we've added an extra name to the flintstones array)

# If we didn't know String#start_with?, we could also say

name[0, 2] == 'Be'


