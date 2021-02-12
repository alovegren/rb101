def multiply(numbers, factor)
  products = []
  counter = 0

  loop do
    break if counter == numbers.size

    products << numbers[counter] * factor
    counter += 1
  end

  products
end

my_numbers = [1, 4, 3, 7, 2, 6]
print multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]