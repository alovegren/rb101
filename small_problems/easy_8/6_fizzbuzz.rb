=begin

Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Problem
- Given two integers representing a start and stop, print out all numbers between the two (inclusive) with three exceptions
  - replace num with 'fizz' if divisible by 3
  - 'buzz' if divisible by 5
  - 'fizzbuzz' if divisible by both

Data Structure
- Range

Algorithm
- write two helper methods to determine if divisible by 3 and 5, iterate through numbers from start to stop, build array of numbers except where replacements are needed. join array with commas and return

- Helper 1
 - Is the number mod 3 equal to 0?

-Helper 2
 - Is the number mod 5 equal to 0?

Main Method
- Iterate through range, inclusive, from start arg to stop arg
  - Return fizzbuzz if fizz and buzz
  - Return fizz if fizz
  - Return buzz if buzz
  - Otherwise, current number
  - Send return to new array
- Output array joined with commas
=end

def fizz?(num)
  num % 3 == 0
end

def buzz?(num)
  num % 5 == 0
end

def determine_fizz_buzz(num)
  word = ''

  word << 'Fizz' if fizz?(num)
  word << 'Buzz' if buzz?(num)

  word.empty? ? num : word
end

def fizzbuzz(start, stop)
  words_arr = (start..stop).map do |num|
    determine_fizz_buzz(num)
  end

  puts words_arr.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz