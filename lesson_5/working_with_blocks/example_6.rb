[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end

# Line 1: #select is called on an array containing two hashes. There are no side effects, and the return value is not used. The return value should be [{ :cat => "cat"}]
# Lines 1-5: A block is executed on each element of the array, whose return value will supply #select with its selection criteria. It will return a new array containing [false, true] which will instruct #select to select the second element in the array but not the first. No side effects here.
# Line 2: #all is called on the current hash, supplying the outer block with a boolean return value. If each iteration of the following block returns true, #all will return true. Otherwise, #all will return false. No side effects here.
# Lines 2-4: A block is executed on each key-value pair of the current hash, returning a boolean value to pass to #all.
# Line 3: The first value of the current string represented by `value` is retrieved. This is used for equality comparison with a string representation of the current symbol represented by `key` (#to_s called on the current key returns a string.) The entire line returns a boolean value, which determines the return value of the current iteration of the block.

# Had we used #any on line 2, a copy of the original array containing both hashes would have been returned since #any? would have evaluated to true for each iteration. The resulting return value passed to select would have been [true, true] 
