# Target structure:

# fulfilled_orders =[
#   {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
#   {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
#   # rest of data
# ]

fulfilled_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

# fulfilled_orders = [
#   {
#     customer_id: 12,
#     customer_name: 'Emma Lopez',
#   },
#   {
#     customer_id: 32,
#     customer_name: 'Michael Richards',
#   },
#   # rest of data...
# ]

# On line 9, we create a local variable `fulfilled_orders` and set it equal to the result of calling Array#map on `customer_orders`. We pass #map a block, setting the current element in the collection equal to the local variable `customer`. Within the block, we declare a hash with two key/value pairs. The keys are the symbols :customer_id and :customer_name, and the values are the values referenced by the same symbol keys in the current `customer` hash. This hash will be the return value for the block and therefore the element in a new hash for this item in the collection. 

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value] if order[:order_fulfilled]
  end

  # 1st iteration: order_value = 
# On line 18, we call Enumerable#each_with_index on `customer_orders`, passing in a block. Within the block, we refer to the current (hash) element as `data` and the current index as `index`.

# We then set a new local variable `order_value` equal to the result of calling Enumerable#reduce on the array associated with the key :orders in the current `data` hash. We give #reduce a starting value of 0, and pass it a block. Within the block, we refer to the current accumulator value as `total` and the current element in the array (a hash) as `order`. We add the value (a float) associated with the key :order_value within the current `order` hash to the accumulator value if the value associated with the key :order_fulfilled within the current `order` hash is true.

# The value bound to `order_value` will be the sum of all of the orders whose order fulfilled status is true.

  fulfilled_orders[index][:order_value] = order_value

# On line 28, we set the value associated with the key :order_value, at the current index of the top level #each method within the `fulfilled_orders` array, equal to the value of `order_value`.

end