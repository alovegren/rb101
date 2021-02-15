['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# We are unfamiliar with this method so we search the Array class page.

# We see three signatures for this method, all of which return an Integer. We can pass no arguments, or an object argument, or a block argument.

# In the code above, we are passing a block which means the code will run the block with each element, and return an Integer count for each element whose evaluation returned a truthy value.

# We can summarize by saying that #count considers the truthiness of the block's return value.

# Based on this, we expect the block to return true for the first two elements and false for the last, and for the method to return the Integer 2.