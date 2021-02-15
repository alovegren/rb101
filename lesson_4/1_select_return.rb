[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# Array#select returns a new array that is the same size or smaller as its caller, containing those elements for which the block returns a truthy value.


# In this case, the last line of the block will return a truthy value regardless of any element passed to it.

# So we expect to see a new array [1, 2, 3] returned. Runnnig this code in irb, this is indeed what we see.