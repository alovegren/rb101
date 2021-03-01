# Problem: Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  new_hash = {}
  hash.each { |key, value| new_hash[key] = value + 1 }
  new_hash
end

# Let's try to guess the #each_with_object solution..
calling_array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
calling_array.each_with_object([]) do |hash, new_array|
  new_hash = {}
  hash.each { |key, value| new_hash[key] = value + 1 }
  new_array << new_hash
end