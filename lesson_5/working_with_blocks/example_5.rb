[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

# Line 1: We call #map on a two dimensional array, containing two sub-arrays who each contain two Integer elements. We assign each element of the array to the local variable `arr` We expect no side effects, and the return value ([[2,4], [6,8]]) is not used.
# Line 2: Within the first #map call, we call #map on each sub-array, assigning each of its elements to the local variable `num`. We expect no side effects, and a return value of [2,4] and [6,8] for the first and second iteration. This return value is used to determine the return value of the outer method call.
# Lines 2-5: We pass a block to arr.map, and execute the contained code on the current element referred to by `num`. We expect the return value to be `num` * 2 for the current element, and this return value is used to determine the return value of the inner method call.
# Line 3: We multiply the value referenced by `num` by two. The resulting value is passed to the block to determine its own return value.