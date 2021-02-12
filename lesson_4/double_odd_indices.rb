def double_odd_indices(numbers)
  counter = 0
  doubled_odd_indices = []

  loop do
    break if counter == numbers.size

    if counter.odd?
      doubled_odd_indices << numbers[counter] * 2
    end

    counter += 1
  end
  doubled_odd_indices
end

my_numbers = [1, 4, 3, 7, 2, 6]
print double_odd_indices(my_numbers)
print my_numbers

