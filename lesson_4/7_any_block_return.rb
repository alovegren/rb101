[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# We consult the documentation for Array#any? and find three signatures, each returning a boolean. The first is the method call with no block or argument given. Used this way, the method will return true so long as any element in the array self has a truthy value.

# The second option is passing a block. #any? will return true if the block evaluates to true for any iteration of the calling array. We expect the block to return true on the first iteration, false on the second, and true on the third. Because we had at least one true value, the method will return true.

# Reading the solution for this problem, we'll make a correction to the above. Since #any? returns true if the block returns true on any iteration, it will stop executing code as soon as the first truthy return value is supplied. So in this case, the loop is exited as soon as the first block is evaluated with a truthy return value.

# The third signature shows us that we can also pass an object to #any? and in this case the method will return true if any element === the given object.