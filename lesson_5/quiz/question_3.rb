arr = [
  {one: '1', two: 2},
  [{four: 5, three: 6}, :three],
  :three,
  {2=>:two, 3=>:three}
]

# `arr` is a nested array containing four elements:
#   - a hash, containing
#     - two key/value pairs
#   - an array, containing
#     - a hash, containing
#       - two key/value pairs
#     - a symbol
#   - a symbol
#   - a hash, containing
#     - two key/value pairs

arr[1][0][:three] # Accesses the element at index 1 of the array, which is an array. Within the array, accesses the element at index 0, which is a key/value pair. Within the pair, accesses the value at the key :three, which is the integer 6. *Correct*

arr[1][1] # Accesses the element at index 1 of the array, which is an array. Within the array, accesses the element at index 1, which is the symbol :three.

# At this point we are going to consult the Ruby documentation for symbols. We are fairly certain that we can access the hash key stored in :three at its first mention, because symbols are unique identifiers. 

# The Ruby documentation states that "The same Symbol object will be created for a given name or string for the duration of a program's execution, regardless of the context or meaning of that name." This doesn't really answer our question, so we'll test it out in irb.

# We see that if we create a symbol object in a hash, and then try to reference it outside the hash, the return value is simply the symbol itself, not the value referenced by the symbol in the context of the hash.

# Furthermore, we see that this question is less about whether symbols exhibit a particular behavior and more about what we are doing (and not doing) when we create a key/value pair within a hash.

# If we were to answer that referencing a symbol which acts as a hash key elsewhere in a program, we would be asserting that the act of populating a hash with key/pair values is akin to assigning values to local variables which are keys. 

# This might be the case-- I don't really know what is happening under the hood. But if it is the case, it must be that such local variables are scoped only within the bounds of the hash itself (as shown by our irb test.) We also note that we cannot create a new variable as we create a hash key, which seems like further evidence that hash keys should not be thought of variables. On with the problem...

arr[1][1] # We access the element at index 1 of the array, which is an array. Within that array, we access the element at index 1, which is the symbol :three. Referencing our long discourse above, we do not expect this reference to return the value for the hash key :three. *Wrong*

arr[2] # We access the element at index 2 of the array, which is the symbol :three. For the same reasons as the last choice, we dub this *wrong*

arr[3][3] # We access the element at index 3 of the array, which is a hash. Within the hash, we attempt to access an element at a numbered index, which will return nil. *Wrong*