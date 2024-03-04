# basic syntax of error handling in ruby is

begin
  # code that can cause error
rescue 
  # mechanism to handle the error
end
puts()


# One kind of error is the division by zero error

begin
  result = 10 / 0
  puts(result)
rescue 
  puts("Dividing a number by '0' is not possible, therefore generating an error.")
end

puts()

# let's have a function which takes in array, index & return the element of the array at that index

def return_item(array, idx)
  begin
    return "Item at index(#{idx}) in the array #{array} is: #{array.fetch(idx)}"
  rescue 
    return ("Index Out Of Bound!!!")
  end
end

# err-code
puts return_item([1,2,3,4],5)
puts()

# correct-code
puts return_item([1,2,3,4],2)
puts()

# using rescue blocks for specific kind of errors
begin
  result = 10 / 0 # genereates ZeroDivisionError

  arr = [1,2,3,4]
  puts(arr["dogs"]) # generates different kind of error
rescue ZeroDivisionError # we are writing this rescue block specific for this kind of error
  puts("Dividing a number by '0' is not possible, therefore generating an error.")
rescue => e# general error handling
  puts("Some error occured during execution, please debug & correct the code.")
  puts(e)
end

puts()

# let's break the upper code

begin
  arr = [1,2,3,4]
  puts(arr["dogs"]) # generates different kind of error
rescue ZeroDivisionError # we are writing this rescue block specific for this kind of error
  puts("Dividing a number by '0' is not possible, therefore generating an error.")
rescue => e# general error handling
  puts("Some error occured during execution, please debug & correct the code.")
  puts("Error MSG: #{e}")
end

puts()