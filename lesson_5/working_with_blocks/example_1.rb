[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]

# Line 1: We call #each on a nested array containing two two-element sub-arrays, passing in the argument `arr` which represents each sub-array in the larger array.
# Line 2: We output the return value of arr.first. That is-- the first element of the array at which our argument `arr` is pointing.
  # Output: First, we print the string corresponding to the .first value of the first sub-array: '1'. Then, we move to the next iteration and print the string corresponding to the .first value of the second sub-array: '3'.
# Output: The return value of the block is nil
# Line 3: We end our #each method, and the original collection is returned.