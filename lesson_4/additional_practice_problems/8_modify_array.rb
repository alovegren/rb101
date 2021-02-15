# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

# On the first iteration, `1` will be printed to the screen, and then it will be removed from the array. We can't be assured of this outcome, but it seems that the method might then 'skip' to the third element in the array at which point it will be deleted after '3' is printed to the screen.

# It is not recommended to modify collections while iterating over them for exactly this reason; the ensuing behavior is unpredictable.

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

# This time we would expect to see 1 output to the screen, then the block would remove and return 4. 2 would then be output to the screen, and then the block would remove and return 3. At this point, numbers would have been entirely iterated through since the last two elements were removed using #pop.