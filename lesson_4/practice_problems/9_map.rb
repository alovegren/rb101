{ a : 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Enumerator#map can be called on a collection, and takes a block argument. It returns a new array made up of the elements for which the block returns true. In this case, the if statement is the last expression evaluated in the block and it will evaluate even if its condition is not met. In that case, it will return nil.

# So in this code, we will be returned a two element array containing nil and 'bear'.

# #map always returns the same n elements with which it started. A better method for what seems to be the intention here would be #select.