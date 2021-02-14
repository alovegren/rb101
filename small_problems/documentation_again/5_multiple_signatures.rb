a = %w(a b c d e)
# puts a.fetch(7)

# With a single Integer argument, .fetch returns the element at the index of the given Integer. Since the Integer is out of range, we guess an error will be thrown? Yep. Let's comment it out.

puts a.fetch(7, 'beats me')

# With arguments 'index' and 'default_value', returns element at given index or 'default_value' if index is out of range. We expect this to output 'beats me'

puts a.fetch(7) { |index| index**2 }

# With arguments 'index' and a block, returns element at given index IF such an element exists. If not, the block is evaluated with 'index' and its return value is returned instead. We expect this to output 49

