=begin
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

Problem
- Given a string, return all palindromic substrings
  - That is, all substrings from the given string that are palindromes (same forwards as backwards)
  - Returned in the same sequence as described in the last problem
  - Include duplicates

Algorithm
- Adjust leading substrings method to only include substrings which are palindromes
- Check if the reversed string equals itself, and then only send that to a new array if so

=end

def palindrome?(substr)
  substr.reverse == substr && substr.length >= 2
end

def leading_palindromic_substrings(str)
  leading_palindromic_substrings = []

  (1..str.size).each do |length|
    substring = str[0, length]
    leading_palindromic_substrings << substring if palindrome?(substring)
  end

  leading_palindromic_substrings
end

def palindromes(str)
  (0...str.size).map { |start_idx| leading_palindromic_substrings(str[start_idx..-1])}.flatten
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]