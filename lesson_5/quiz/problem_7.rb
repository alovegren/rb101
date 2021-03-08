[['a', 'b'], ['c', 'd'], ['e', 'f']].map do |sub_arr|
  sub_arr.map do |letter|
    letter.upcase
  end
end

# We have an array containing three sub-arrays, each containing two string objects. We call #map on each sub-array in the collection, setting the current element equal to the local variable `sub-arr`. On each iteration, we call the #map method on `sub-arr`, in turn iterating through the string objects contained by all `sub-arr`s. #map will return a new collection of transformed elements based on the return values of its block at each iteration. On the second #map call, we set each string object in the collection equal to the local variable `letter`, and within the block we call the #upcase method on the current string.

# Innermost block output for all iterations: 'A', 'B', 'C', 'D', 'E', 'F'
# Return value for inner #map call: ['A', 'B'], ['C', 'D'], ['E', 'F']
# Final return value of code: [['A', 'B'], ['C', 'D'], ['E', 'F']]


# Options:

# The return value of the String#upcase method is returned by the inner block to the inner call to Array#map; this in turn returns each uppercased string to the outer block, which returns it to the outer call to Array#map. This outer call to map creates a new flat array, populated by uppercased versions of each string. *Wrong* The resulting array is two-dimensional.

# The return value of the String#upcase method is returned by the inner block to the inner call to Array#map. Array#map ignores the return value of the block and simply returns the calling object (i.e. the inner array that was passed to it for that iteration). This inner array is passed by the outer block to the outer call to Array#map, which in turn ignores the return value and returns the calling object (i.e. the original nested array). *Wrong* #map does not ignore the return value of the block.

# The return value of the String#upcase method is returned by the inner block to the inner call to Array#map; this adds the uppercase string to a new array in place of the lowercase version. This new array is returned by the outer block to the outer call to Array#map. This call to map also creates a new array, populated by the new inner arrays (containing the uppercase strings), which it then returns. *Correct*

# Within the inner block, the String#upcase method is called on each element of the inner array for that iteration. Since the String#upcase method is non-destructive, the inner call to Array#map simply returns the same sub-array that was passed to it by the outer block; this in turn is passed to the outer Array#map call, which returns an unchanged array. *Wrong* Map evaluates the code within a block to determine the new value for an element in a new collection.