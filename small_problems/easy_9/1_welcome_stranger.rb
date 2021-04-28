=begin

Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

=end

def greetings(name_arr, job_hash)
  first_middle_last = name_arr.join(' ')
  title_occupation = "#{job_hash[:title]} #{job_hash[:occupation]}"
  
  "Hello, #{first_middle_last}! Nice to have a #{title_occupation} around."
end


p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

