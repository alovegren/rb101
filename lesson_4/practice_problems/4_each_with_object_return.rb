['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# We just read about Enumerable#each_with_object and hope to remember how it behaves correctly...

# In this case, we are initializing an empty hash 'hash' using the {} as an object argument and passing in the parameters value and hash within the block.

# If we recall correctly, this method will return the original array since the return value of the block is not considered.

# The return value is not what we expected...

# => {"a"=>"ant", "b"=>"bear", "c"=>"cat"} 

# We expected the calling collection to be returned here, but in fact what was returned was the original object 'hash' passed into the method. We passed in a value to the collection at each iteration of our original array boject, and its value was updated three times until becoming our final return value.