# The total value of orders for each customer
# The total value of fulfilled orders for each customer

order_data = [
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 351, order_date: '12/04/16', order_fulfilled: true, order_value: 135.99},
  
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 383, order_date: '12/04/16', order_fulfilled: true, order_value: 289.49},
  
  {customer_id: 12, customer_name: 'Emma Lopez', order_id: 392, order_date: '01/10/17', order_fulfilled: false, order_value: 58.00},
  
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 241, order_date: '11/10/16', order_fulfilled: true, order_value: 120.00},
  
  {customer_id: 32, customer_name: 'Michael Richards', order_id: 395, order_date: '01/10/17', order_fulfilled: false, order_value: 85.65},
  # rest of data...
]

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

# We see here that we want to restructure the data such that orders are grouped by customer, rather than by order ids. The objective is to create a data structure wherein hashes grouping all of the customer information are nested in a larger array. Within each customer hash are key/value pairs for the customer's ID, name, and list of orders. The value for the orders key is an array which contains hashes representing each order. Within each hash are key/value pairs specifying the status of the order (fulfilled or not), and the value of the order (a float).

# We want to select all options which will correctly restructure the code

# # # OPTION 1 # # # WRONG #
customer_orders = {} # We create a new hash referenced by the local variable `customer_orders`

order_data.each do |row|
  if customer_orders.has_key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << [
      row[:order_fulfilled],
      row[:order_value]
    ]
# We iterate through the `order_data` array, referring to each contained hash as the local variable `row`. First we check if the `customer_orders` hash contains a key equal to the value associated with the key :customer_id in the current hash. 

# If it does, we access the value associated with the key :orders within it, and add a two element array to it containing 1. the value of the key :order_fulfilled in the current hash and 2. the value of the key :order_value in the current hash. This leaves us with a two element array containing a boolean and a float. We see already that this solution is wrong because it leaves off the :order_fulfilled and :order_value keys that we ultimately want in our innermost hash.

  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        [
          row[:order_fulfilled],
          row[:order_value]
        ]
      ]
    }
  end
end


customer_orders = customer_orders.values




# # # OPTION 2 # # # WRONG #
temp_orders = {} # We create a new hash referenced by the local variable `temp_orders`

order_data.each do |row|
  temp_orders[row[:customer_id]] = {
      customer_name: row[:customer_name],
      customer_id: row[:customer_id],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
    }
end

# On line 76, we iterate through the original `order_data` array, assigning the current hash element in the array to the local variable `row`. On each iteration, we create a key/value pair. The key in this pair is equal to the value associated with the key :customer_id within the current `row`. The value is a hash containing three key/value pairs. The three keys are the symbols :customer_name, :customer_id, and :orders. The values for the first two keys are the keys in the current hash `row` corresponding to the symbol values of the same names. The value of the last key, :orders, is an array containing a hash with two key/value pairs. 

# We see the problem with this solution is that on each iteration, the array associated with the hash key :orders will be overwritten with the data for the current order. So we dub this solution *Wrong*

customer_orders = temp_orders.values




# # # OPTION 3 # # # CORRECT #
customer_orders = {} # We create a new hash referenced by the local variable `customer_orders`

order_data.each do |row|
  if customer_orders.has_key?(row[:customer_id])
    customer_orders[row[:customer_id]][:orders] << {
      order_fulfilled: row[:order_fulfilled],
      order_value: row[:order_value]
    }
# We iterate through the original `order_data' array using Array#each, representing each hash in the array with the local variable `row`.

# We check whether the new `customer_orders` hash contains a key equal to the value of the key :customer_id within the current row. If it does, we access the value of the customer_orders hash at the key equal to the value of the key :orders within the value of the key :customer_id within the current row.

# At this point, it is likely that this solution is wrong because we have lost the key :customer_id that should be present in our new hash. Instead, the data pertaining to each customer is simply represented by the customer's ID as a top-level hash key.

# Anyway, we finally add a hash to the value we just accessed, containing two key/value pairs. The two keys are the symbols :order_fulfilled and :order_value, respectively. The two values are the values of the keys associated with the symbols of the same names within the current `row`.

  else
    customer_orders[row[:customer_id]] = {
      customer_id: row[:customer_id],
      customer_name: row[:customer_name],
      orders: [
        {
          order_fulfilled: row[:order_fulfilled],
          order_value: row[:order_value]
        }
      ]
    }
  end
end

# Oh, this looks promising after all. If our if statment evaluates false, we create an entry within our `customer_orders` hash where the key is the value of the current `row` associated with the key :customer_id. The value of this entry is a hash containing three key/value pairs, the symbols :customer_id, :customer_name, and :orders, respectively. The first two keys are associated with values equal to those in the current `row` with keys of the same names. The third value is an array containing two key value pairs, :order_fulfilled and :order_value. The value for each of these keys is determined by pulling the values for the keys of the same names from the current `row` hash.

# To summarize, this code iterates through each order hash in the original `order_data` array. If a new hash `customer_orders` contains a given customer ID, the data is updated by adding a new hash to the `orders` array containing data about a specific order. If the customer ID is not contained by the top-level hash, a hash entry is created containing the customer's identifying information and the data corresponding to their first listed order.

customer_orders = customer_orders.values

# Finally, `customer_orders` references a new array of hashes which is the result of calling Hash#values on `customer_orders`. This adjusts our top-level structure to what we want, an array. *Correct*



# # # OPTION 4 # # # WRONG #
customer_orders = order_data.map do |row|
  {
    customer_id: row[:customer_id],
    customer_name: row[:customer_name],
    orders: [
      {
        order_fulfilled: row[:order_fulfilled],
        order_value: row[:order_value]
      }
    ]
  }
end

# On line 142, we create a local variable `customer_orders` and set it equal to the return value of calling Array#map on `order_data`, passing it a block.

# We know that the return value of the block will determine each new element of the new array returned by #map.

# Within the block, we assign the current hash element of `order_data` to the local variable `row`. We then proceed, for each iteration, to create a hash containing three key/value pairs. The hash is constructed in exactly the way we want the new data to be restructured, pulling values from the current `row` which references our old data structure. HOWEVER, in our new structure, we want only a single hash for each unique customer. This solution will map out the data in the structure that we want it, but not group orders by customer. *wrong*