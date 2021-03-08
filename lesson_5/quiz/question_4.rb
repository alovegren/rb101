todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  }
]

# `todo_lists` is a nested collection. The outer object is an array, which contains a hash. Within the hash, we have two key/value pairs where both keys and values reference only one object. The third key is a symbol, and the third value is an array containing three hashes. Each hash contains three key/value pairs.

# We want to select the correct option to change the string 'Apple Juice' to 'Orange Juice'

todo_lists[0][:todos][2] = 'Orange Juice' # This code first references the element at index 0 in the top-level array, which is a hash. Within that hash, we access the value at the symbol :todos, which is an array. Within the array, we access the third element, which is a hash. Setting this final output equal to 'Orange Juice', we have replaced the entire hash with a string, which is not what we want. *Wrong*

todo_lists[1][:todos][3][:name] = 'Orange Juice' # First we reference the second element of `todo_lists`, which is out of bounds because `todo_lists` only has one element. *Wrong*

todo_lists[0][:todos][2][:name] = 'Orange Juice' # First we reference the first element of `todo_lists`, which is a hash. Within the hash, we access the value stored by the key :todos, which is an array. Within the array, we access the third element, another hash. Finally, within the hash, we access the value stored by the key :name, which is 'Apple Juice'. We set this equal to 'Orange Juice', which was our intended goal. *Correct*

todo_lists[:todos][2][:name] = 'Orange Juice' # We attempt to access the value stored by some key :todos within the top level of `todo_lists`. Since `todo_lists` is an array, we cannot access values by keys and so we expect an error to be thrown. We'll check in irb with a different example since we suspect the return value could be nil, too. Nope, it's an error. We're trying to reference a symbol that doesn't yet exist. *Wrong*