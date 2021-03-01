# Using the each method, write some code to output all of the vowels from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# To access string elements: hsh[key][elem]

hsh.each_value { |word_array| puts word_array.join.delete('^aeiou').chars }

# Again, we should probably practice accessing each level of our collection so we'll write another solution:

hsh.each_value do |word_array|
  word_array.each do |word|
    word.chars.each do |character|
      puts character if %w(a e i o u).include?(character)
    end
  end
end