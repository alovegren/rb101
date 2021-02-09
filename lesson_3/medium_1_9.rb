def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes": "no"
end

puts bar(foo)

# We expect the above code to output "no"

# We are invoking the method bar and passing in the argument foo which is itself a method. The method foo evaluates to "yes" no matter what, though it does accept one optional argument. So we pass this "yes" into bar() which evaluates to "no" if its optional parameter is not "no".