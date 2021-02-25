[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

# Line 1: #map is called on a two dimensional array containing two sub-arrays with two elements each. On each iteration, the current sub-array will be assigned to the local variable arr. #map will return a new array containing the return values of the block called on each instance of `arr.` The return value will not be used, but it will be shown as a return if run in irb: [1, 3]
# Lines 1-4: A block is executed on each sub-array within our larger array. The return value on each iteration will be the return of the last line: the first element in each sub-array represented by 'arr' and it will be used to form the elements of the new array to which we are mapping
# Line 2: #first is called on 'arr', which produces no side effect but returns the first element of 'arr'. Then #puts is called on the resulting return value. This outputs a string representation of the first element of 'arr' (first '1', then '3') and returns nil. The return value is not used.
# Line 3: #first is called again on 'arr', which again produces no side effect but returns the first element of 'arr'. This ends up being the return value of the block, which is used by #map to determine the element corresponding to the current element 'arr' in the new array.

# 1
# 3
# => [1, 3]