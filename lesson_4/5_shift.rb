hash = { a: 'ant', b: 'bear' }
hash.shift

# We look to the Ruby docs to see if Hash has a #shift method...

# We find one such method with one signature, informing us that the method takes no arguments and returns a key-value pair or a default value for the hash (nil, by default. otherwise whichever value was set)

# #shift removes the first hash entry and returns an array containing the associated key and value as elements.