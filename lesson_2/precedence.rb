array = [1, 2, 3]

p(array.map { |num| num + 1 }) # outputs [2, 3, 4]
                              # => [2, 3, 4]

p(array.map) do |num|
  num + 1                     # outputs #<Enumerator: [1, 2, 3]
end                           # => #<Enumerator: [1, 2, 3]

# the method 'p' does not accept a block, so it just gets ignored
# in the case above