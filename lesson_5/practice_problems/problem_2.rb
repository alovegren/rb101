# # Problem: How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort { |a, b| a[:published] <=> b[:published] }

# Alternatively, we can use #sort_by:

books.sort_by { |book| book[:published] }

# Remember to mentally confirm that each object being sorted has access to <=>

# We also want to note here that when sorting strings, we should pay special attention to the length of the string and any differences that would cause the elements to be sorted unexpectedly. Years are formatted nicely, but if we were comparing string representations of numbers who had varying amounts of digits, this method may not have worked.