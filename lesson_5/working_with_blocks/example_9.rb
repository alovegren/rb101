[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end

# Line 1: #map is called on a three-dimensional array containing two sub-arrays who each contain 4 and 3, respectively, single-element arrays. On each iteration, the current sub-array is assigned to the local variable `element1`. Its return value will be a new array transformed on the basis of the outermost block's return value.
# Lines 1-7: a block is executed on each element represented by `element1`. Its return value will be used as the transformation criteria by #map.
# Line 2: #each is called on each sub-array (one level down). The current sub-array is assigned to the local variable `element2`. Its return value will be the original object on which it was called, and it will be used to determine the return value of the block containing it.
# Lines 2-6: a block is executed on the element of the current sub-array; that is, each single-element array. Its return value will be ignored by the method call containing it.
# Line 3: #partition is called on each element in the current sub-array (two levels down). Its return value will be a two-element array containing first the elements for which the contained block returns true, and then those for which it returns false. This value will be used to determine the return value of the block containing it.
# Lines 3-5: a block is executed on the current element. Its return value will make up part of the return value of the entire #partition call.
# Line 4: #size is called on the current element, returning an Integer. The > operator is then called on this Integer, and the resulting return value is a boolean. This boolean value is used by the parent block to determine the return value on each iteration.

# Because #each was used on the second level of method calls, this program will simply return its original array.

