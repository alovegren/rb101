produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def display_fruit(produce_list)
  fruit = Hash.new
  keys = produce_list.keys
  i = 0

  loop do
    break if i == keys.size
    current_key = keys[i]
    current_value = produce_list[current_key]
    if 'Fruit'.include?(current_value)
      fruit[current_key] = current_value
    end
    i += 1
  end 

  print fruit
end

display_fruit(produce)