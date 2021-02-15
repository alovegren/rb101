flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# We know we must pick an approach that *transforms* our collection, so we naturally think of Array#map

# #map will take a block argument and return a new array made up of the elements of self upon which the block has been evaluated.

# If we use the destructive #map!, the original array will be returned with its elements replaced by those that would have made up a new array as described above.

flintstones.map! { |name| name[0, 3] }