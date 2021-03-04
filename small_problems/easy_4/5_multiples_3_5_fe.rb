# We turn to the Ruby documentation to investigate Enumerable#inject, and find four signatures:

# inject(initial, sym) → obj
# inject(sym) → obj
# inject(initial) { |memo, obj| block } → obj
# inject { |memo, obj| block } → obj

# In general, this method combines all of the elements of the calling object using an operation specified as an argument(s), whether that includes a block or not. If a block is passed, an 'accumulator value' is passed to the block as a local variable. We can think of this as the running result of the operation being called on the current element.

# If an argument 'initial' is not defined, #inject will begin with the first element in the collection 

# We can condense the following code using #inject/#reduce

# def multisum(upper)
#   multiples = []

#   for i in 1..upper
#     multiples << i if i % 3 == 0 || i % 5 == 0
#   end

#   multiples.sum
# end

def multisum(upper)
  (1..upper).inject do |sum, integer|
    next unless integer % 3 == 0 || integer % 5 == 0
    sum + integer
  end
end

# This solution is slightly more concise, but perhaps a little less clear than the previous one.

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168
