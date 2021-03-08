# # The total value of orders for each customer
# The total value of fulfilled orders for each customer

customer_orders = [
  {
    customer_id: 12,
    customer_name: 'Emma Lopez',
    orders: [
      { order_fulfilled: true, order_value: 135.99 },
      { order_fulfilled: true, order_value: 289.49 },
      { order_fulfilled: false, order_value: 58.00 }
    ]
  },
  {
    customer_id: 32,
    customer_name: 'Michael Richards',
    orders: [
      { order_fulfilled: true, order_value: 120.00 },
      { order_fulfilled: false, order_value: 85.65 }
    ]
  },
  # rest of data...
]

# From our `customer_orders` array, we want to create two new arrays: one containing hashes each listing a customer's information and the total value of all of their orders, and another containing hashes each listing a customer's information and the total value of their fulfilled orders.

all_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', total_order_value: 483.48},
  {customer_id: 32, customer_name: 'Michael Richards', total_order_value: 205.65},
  # rest of data
]


fulfilled_orders =[
  {customer_id: 12, customer_name: 'Emma Lopez', order_value: 425.48},
  {customer_id: 32, customer_name: 'Michael Richards', order_value: 120.00},
  # rest of data
]

# # # OPTION 1 # # # CORRECT #
all_orders = customer_orders.map do |customer|
  {
    customer_id: customer[:customer_id],
    customer_name: customer[:customer_name]
  }
end

# On line 41, we create a new local variable `all_orders` and set it equal to the result of calling Array#map on `customer_orders`. We pass #map a block, and within the block we assign the current element in the iteration (a hash) equal to the local variable `customer`. We know that the return value for the block will determine the new value in the new array `all_orders` for the current element. This code returns a hash containing two key/value pairs. The keys are the symbols :customer_id and :customer_name and the values are the values in each of the top-level hashes in `customer_orders` associated with the keys :customer_id and :customer_name. So far, so good.

customer_orders.each_with_index do |data, index|
  order_value = data[:orders].reduce(0) do |total, order|
    total + order[:order_value]
  end

  all_orders[index][:total_order_value] = order_value
end

# On line 50, we call #each_with_index on `customer_orders` and pass it a block. Within the block, we assign the current element in the top-level array equal to the local variable `data`, and the index of that element equal to `index.`

# Next, we create a local variable `order_value` pointing to the result of calling Enumerable#reduce on the value (an array) associated with the key :orders in the current hash referenced by `data`. Setting an initial value of 0, we pass #reduce a block wherein `total` refers to the current accumulator value and `order` refers to the current element in the collection. On each iteration, we add the current accumulation to the value associated with the key :order_value within the `order` hash. We expect the variable `order_value` to point towards a float that is the total of all of the :order_value values, which is what we want.

# Finally, we set the value of the key :total_order_value within the hash at the current index of the `all_orders` array. This is what we want. *Correct*



# # # OPTION 2 # # # CORRECT #
all_orders = customer_orders.map do |customer_data|
  order_value = customer_data[:orders].inject(0) do |total, order_data|
    total + order_data[:order_value]
  end

# On line 67, we set the local variable `all_orders` equal to the result of calling Array#map on `customer_orders`. On each iteration, we assign the current element (a hash) equal to the local variable `customer_data`. #map will return a new array containing the return values of the block for each element on which it is called.

# Within the block, we set the local variable `order_value` equal to calling Array#inject on the array value associated with the key :orders in the current hash represented by `customer_data`. We pass #inject a block with two parameters where `total` refers to the accumulator value as the iteration progresses and `order_data` refers to the current element in the collection-- that is, each hash contained by the array. On each iteration, we add the value associated with the key :order_value (a float) to the accumulator value. The variable `order_value` will contain the result of #inject, a float number.

  {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: order_value
  }

# On lines 76-80, we declare a hash containing three key/value pairs. The three keys are the symbols :customer_id, :customer_name and :total_order_value. The first two values are the values associated with the keys :customer_id and :customer_name within the `customer_data` hash. This is what we want. The last key is equal to the float value we stored in `order` value on line 68.

# The hash declared above will be the return value of the block passed to #map at each iteration, thereby allowing #map to create a new array of one-dimensional hashes containing the information we want. *Correct*
end


# # # OPTION 3 # # # CORRECT #
all_orders = [] # We set a new local variable `all_orders` equal to an empty array.

customer_orders.each do |customer_data|
  customer_total_orders = {
    customer_id: customer_data[:customer_id],
    customer_name: customer_data[:customer_name],
    total_order_value: 0
  }

# On line 91, we call Array#each on customer_orders, passing it a block. Within the block, we reference each hash element with the local variable `customer_data`. On line 92, we create the local variable `customer_total_orders`, binding it to a hash containing three key/value pairs. The keys are the symbols :customer_id, :customer_name, and :total_order_value. The first two values are the values associated with the keys :customer_id and :customer_name within the current `customer_data` hash. The last value is initialized at zero. So far, so good.

  customer_data[:orders].each do |order|
    customer_total_orders[:total_order_value] += order[:order_value]
  end

# On line 100, we call Array#each on the array value associated with the key :orders within the current `customer_data` hash. For each element of the array, referenced by the local variable `order`, we increment the value stored with the key :total_order_value in the `customer_total_orders` hash by the value of the current `order` at :order_value.

  all_orders << customer_total_orders

# Finally, we add the `customer_total_orders` hash to the `all_orders` array.
end

# We should end up with one properly formatted hash entry per customer in `customer_orders` contained in an array referenced by `all_orders`, which is what we want. *Correct*



# # # OPTION 4 # # # WRONG #
all_orders = []
# On line 116, we set the local variable `all_orders` equal to an empty array.

customer_orders.each do |customer_data|
  cust_arr = [
    [:customer_id, customer_data[:customer_id]],
    [:customer_name, customer_data[:customer_name]],
    [:total_order_value]
  ]

# We then call Array#each on `customer_orders`. We pass #each a block, referencing the current element in the array with the local variable `customer_data`. Within the block, we create a local variable `cust_arr` and bind it to an array containing three sub-arrays. The first array contains the symbol :customer_id and the value referenced by the key :customer_id within the current `customer_data` hash. The second array contains the symbol :customer_name and the value referenced by the key :customer_name within the current `customer_data` hash. The last array contains one element, the symbol :total_order_value

  order_value = 0
  customer_data[:orders].each do |order|
    order_value += order[:order_value]
  end

# On line 128, we initialize a new local variable `order_value` at 0. Then, we call Array#each on the value associated with the key :orders in the current `customer_data` hash. We pass #each a block, whereupon we reference the current element in the iteration (a hash within :orders) with the local variable `order`. Then, we increment the value bound to `order_value` by the value associated with the key :order_value in the current hash `order`. The resulting value for `order_value` on this iteration will be the sum of all of the customer's order values.

  cust_arr[2] << order_value

# The value bound to `order_value` will be added as an element in the array referenced by `cust_arr`.

  all_orders << cust_arr

# The array `cust_arr` will be added as an element to the array `all_orders`. This is not the format that we want, as there should be hashes nested within the top-level array, not arrays. *Wrong*
end