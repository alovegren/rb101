[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# Line 1: #map is called on our starting array, [ [1, 2], [3, 4]] , [5, 6] ]. A new array will be returned, with both of our current array's elements transformed: [ [2, 3], [4, 5]] , [6, 7] ] There are no side effects and the return value will not be used.
# Lines 1-11: A block is invoked within the top level #map, iterating for each of the two sub-arrays one level down in our array: [[1, 2], [3, 4]] and [5, 6]. Each of these elements, assigned to the local variable 'arr' and then transformed, will be the return value of our block: [[2, 3], [4, 5]] and [5, 6]. This will be passed to the top level #map call to determine its return value.
# Line 2: #map is called on each of the sub-arrays. On each iteration, it will be passed one of the two sub-arrays mentioned in the last paragraph. It will return each one transformed, and they will both be used to determine the return value of the containing block.
# Lines 2-10: Within the second level #map, a block is invoked on each element of each of the two sub-arrays: [1,2], [3, 4], and then 5 and 6. Each of these elements will be assigned to the local variable 'el'. The elements will be transformed and passed to the parent #map to make up its return value.
# Line 3: Working backwards, we see a method call #to_s performed on the current value of 'el', which will return a string representation of that element and then pass it along to #size. #size will return an integer representing the size of the return of el.to_s, and that return value will then be supplied to the operator '==' to be compared with the Integer 1. This will return a boolean, which will be supplied to an if statement. The if statement will return the value of whichever expression evaluated.
# Line 4: If 'true' was passed to our conditional, we will perform addition on the current element and the resulting value will be supplied as the return value for the current iteration of the if statement and block. In this case, the values passed will be 6 and 7 and they will return 7 and 8, respectively.
# Line 6: If 'false' was passed to our conditional, #map is called on the current element of the parent #map. In this case, it will be called on [1,2] and then [3,4] and the return values will be [2, 3] and [4, 5], respectively.
# Lines 6-8: A block is invoked on the values inside the arrays for which the conditional returned false. Each of these values is in turn assigned to a local variable 'n' and on each invocation, an incremented version of the value is returned: 2, 3, 4, and 5. These values are passed to the conditional to make up its return value.
# Line 7: The current element 'n' is incremented by 1. The result of this arithmetic expression makes up the return value for the block on the current iteration.