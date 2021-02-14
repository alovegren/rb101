a = [1, 4, 8, 11, 15, 19]

# We find the Array#bsearch method and find that it returns either an element from iself selected by a binary search OR an array containing boolean values corresponding to the elements as evaluated by the selection criteria.

# This method seems to be commonly used for finding minimums in a sorted array. In fact, although an error won't be raised, we should be sure to pass in a sorted array to  Array#bsearch

p a.bsearch { |num| num > 8 }

# We also take note of this exercise name and find that we must pass a block to #bsearch or else an enumerator will be output ;-)