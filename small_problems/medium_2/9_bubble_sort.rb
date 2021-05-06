require "pry"
=begin

Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

Problem
- Given an array, return the same array with the elements sorted using bubble sort
  - Bubble sort iterates through each two consecutive elements in the collection repeatedly
    - If the first element is greater than the second, it exchanges them
  - It does this until an entire pass through each two consecutive elements can be made with no exchanges 

Data structure
- Array

Algorithm
- Start an outer loop. Within this loop, iterate through every pair of consecutive elements
  - Initialize a count of exchanges made

  - Iterate through the range from 0 to the last element in the array, non-inclusive
    - If the element at the index of the current number is greater than the element at the next index
      - swap them using indexed reassignment
        - element at the current index, next index is equal to the elements at next index, current index
      - Add one to the count of exchanges made
  - Break from outer loop if the count of exchanges is zero
- Return the mutated array

=end

def bubble_sort!(arr)
  loop do
    exchange_count = 0

    (0...arr.index(arr.last)).each do |first_index|
      next_index = first_index + 1

      if arr[first_index] > arr[next_index]
        arr[first_index], arr[next_index] = [arr[next_index], arr[first_index]]
        exchange_count += 1
      end
    end

    break if exchange_count == 0
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)