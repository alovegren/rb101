ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# Hash#reject accepts a block as an argument and returns a new array containing only elements for which the block returns false or nil. If no argument is given, it returns a new enumerable object.

# We elect to use the destructive #reject! which will return self if any elements are removed.

ages.reject! { |_, age| age >= 100 }

# Through the solution we also discover #keep_if, which accepts a block as an argument (or returns a new enumerator if none is given) and returns the original, modified hash-- making this a destructive method.

# #keep_if will keep each entry in the hash for which the block returns true. If the block returns false on a given iteration, the associated key-value pair will be deleted. 

# Let's whittle down our hash to only include those who are of legal drinking age in the US.

ages.keep_if { |_, age| age >= 21 }