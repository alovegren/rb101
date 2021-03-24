# # Problem: You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed. Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# No. String#split returns a new array, and although we call the destructive reverse! within the invocation of #each, we are mutating each object of this array. We then call Array#join which returns a new string. The return value of this method is the new string returned by #join.