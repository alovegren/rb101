todo_lists = [
  {
    id: 1,
    list_name: 'Groceries',
    todos: [
      { id: 1, name: 'Bread', completed: false },
      { id: 2, name: 'Milk', completed: false },
      { id: 3, name: 'Apple Juice', completed: false }
    ]
  },
  {
    id: 2,
    list_name: 'Homework',
    todos: [
      { id: 1, name: 'Math', completed: false },
      { id: 2, name: 'English', completed: false }
    ]
  }
]

# `todo_lists` is an array containing two elements, each hashes. Within each hash, there are three key/value pairs. The third value of each hash is an array containing additional hashes. Finally, each of those hashes contain three key/value pairs.

# We want to select the option(s) that would set the value for :completed to true for all of the homework to-dos

todo_lists[1].each do |list_key, list_value|
  if list_key == :todos
    list_value.each { |todo| todo[:completed] = true }
  end
end

# In the code above, we first access the second element of `todo_lists`, which is the top level hash containing the information and list of homework todos. We iterate through each key/value pair using #each. If we land on a key equal to :todos, then we iterate through the array referenced by :todos. Finally, we access the values for the keys :completed, and set them equal to true. *Correct*



todo_lists[1][:todos][0][:completed] = true
todo_lists[1][:todos][1][:completed] = true

# On line 33, we access the second element of `todo_lists`, a hash. Then we access the value of the key :todos, an array containing two hashes. We select the first hash, and within it the value of the key :completed. This we set equal to true, and expect the change to be reflected in the original array, since this type of assignment is mutating. On line 34, we repeat the process for the second hash in `todos`, which is what we want. *Correct*



todo_lists.each do |list|
  if list[:list_name] == 'Homework'
    list[:todos].each do |todo|
      todo[:completed] = true
    end
  end
end

# This code calls the #each method on `todo_lists`, which we know will return the object on which it was called. For each hash in `todo_lists`, we check if the value of the hash at the key :list_name is equal to 'Homework'. If so, we iterate through the array corresponding to the key :todos using #each. For each hash element in the array, we access the value corresponding to the key :completed. This we set to true, which changes the hashes in place. *Correct*



todo_lists[1][:todos].each do |todo|
  todo[:completed] = true
end

# First, we access the second element of `todo_lists`, a hash. Within that hash, we select the value associated with the key :todos, which is an array. We iterate over this array, assigning each hash contained by it to the local variable `todo`. Within the hash, we access the value associated with the key :completed, and set it equal to true. *Correct*
