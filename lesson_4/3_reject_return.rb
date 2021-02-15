[1, 2, 3].reject do |num|
  puts num
end

# Again we are not familiar with this method so we consult Array#reject

# We find the method with two signatures; one accepting a block and returning a new Array object, and another given no parameters and returning a new Enumerator object.

# In this case, we're concerned with the first signature. We know our code will return a new array object whose objects are those from self for whom the block evaluates to false or nil (seems like the opposite of the #select method)

# So we note that the return value of the block is very much considered with #reject and we expect the return value of the method itself to be a new array containing the same three elements as self, since the puts statement causes each return value to be nil.