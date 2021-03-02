# Problem: Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [
       {a: [1, 2, 3]}, 
       {b: [2, 4, 6], c: [3, 6], d: [4]},
       {e: [8], f: [6, 10]}
      ]

# Input: nested array: each sub-array is a hash containing one or more key-value pairs whose keys are symbols and values are arrays containing one or more integers.
# Output: An array of the same structure as above, excluding any hashes whose value arrays contain odd integers

# output_arr = [
#               {e: [8], f: [6, 10]}
#              ]

# Rules
# - Data structure should stay the same: [{i: [arr], j: [arr]}]

# # Algorithm
# - Call #reject on arr. From working on this problem a bit, we have decided we want to reject those hashes that contain at least one 'false' value rather than select those that have all 'true'values
# - On each iteration, pass a hash to #reject. Initialize a 'booleans' array to store all of our boolean values for all of the iterations of key/value pairs. Within the block, call #map on the current hash with the intention of mapping out all of the true/false values for the contained integers (based on their evenness or oddness)
# - Within the current key/value pair of the current hash, call map again on the array contained in the value. Check each integer for evenness.
# - Add the result of the double-decker #map calls to our booleans array, understanding that it will contain nested arrays of boolean values.
# - Flatten the booleans array and then check for any instance of 'false'

arr.reject do |hsh|
  booleans = []
  booleans << hsh.map do |_, num_array|
                num_array.map { |num| num.even? }
              end
  booleans.flatten.include?(false)
end