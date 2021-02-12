names = ['Sally', 'Joe', 'Lisa', 'Henry']

# First to last:

loop do
  puts names.shift
  break if names == []
end

names = ['Sally', 'Joe', 'Lisa', 'Henry']

# Last to first:

loop do
  puts names.pop
  break if names == []
end