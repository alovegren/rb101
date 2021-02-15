[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# We are working with map again which takes a block argument and returns a new array of self.size. 

# In this case, we expect #map to return the array [1, nil, nil]

# The first integer 1 causes the statement following `else` to evaluate, which is num, sending the integer to a new array. The next two integers are greater than one, so their corresponding values in the new array are each nil, since this is the output of a puts statement.