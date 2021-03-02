# Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

[["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# Input: Hash
# Output: Array

new_array = hsh.each_with_object([]) do |(key, value), array|
              if hsh[key][:type] == 'fruit'
                  array << hsh[key][:colors].map(&:capitalize)
              else
                  array << hsh[key][:size].upcase
              end
            end

print new_array

# Instead of using #each_with_object, we can select a method that returns a new array anyway to simplify things a little bit:

hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map(&:capitalize)
  else
    value[:size].upcase
  end
end