['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# We just read about Enumerable#each_with_object and hope to remember how it behaves correctly...

# In this case, we are initializing an empty hash 'hash' using the {} as an object argument and passing in the parameters value and hash within the block.

# If we recall correctly, this method will return the original array since the return value of the block is not considered.

# The return value is not what we expected...

# => {"a"=>"ant", "b"=>"bear", "c"=>"cat"} 

# We expected the calling collection to be returned here, but in fact what was returned was the original object 'hash' passed into the method. We passed in a value to the collection at each iteration of our original array object, and its value was updated three times until becoming our final return value.

# Looking at this a few weeks later, I can explain to my past self what is going on here. 

# #each_with_object accepts a collection object as an argument, and takes a block. The parameters within the block refer first to the element in the calling collection, and then to the collection object passed as an argument. 

# In the example above, within the block, the element at the first index of each element in the calling object is assigned to be the key of a new hash entry. The corresponding value to that key is the current element of the calling object. Because indexed assignment is mutating, we are modifying the hash that we created through #each_with_object. #each_with_object returns the given object, NOT the calling collection.