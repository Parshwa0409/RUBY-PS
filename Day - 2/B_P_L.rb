# Block is a set of statement to be executed written in {} or do ... end statement, & we can pass block arguments easily.

numbers = [6, 4, 5, 2]

############## { |Block Args| statement/code to be executed }
# numbers.each { |number| puts("One of the element of the array is: #{number}") }
numbers.each { |number| puts("Square of #{number} is: #{number**2}") }
puts()

# same thing can be done by do ... end block

numbers.each do |num|
    puts("Square of #{num} is: #{num**2}")
end

# Create your own function which would execute any block we pass in ...
def do_anything
    yield
end

puts()
do_anything {numbers.each { |number| puts("Square of #{number} is: #{number**2}") }}
puts()
do_anything {numbers.each { |number| puts("One of the element of the array is: #{number}")}}

# lets write a function which will replicate the 'each()' function
def each(array)
    i = 0
    while(i<array.length())
        number = array.fetch(i,false)
        puts("Square of #{number} is: #{number**2}")
        i += 1
    end
end

puts()
each(numbers)

# lets replicate the 'each()' with two parameters array, block as parameters & block to be executed explicitly
def each(array,&block)
    i = 0
    while(i<array.length())
        number = array.fetch(i,false)
        block.call(number)
        i += 1
    end
end

puts()
each(numbers){|number|  puts("Square of #{number} is: #{number**2}")}

# we can replicate 'each()' without specifying the block-params & using implicit call / yield.
def each(array)
    i = 0
    while(i<array.length())
        number = array.fetch(i,false)
        yield number # yeild -param- anything folled after yeild will act as the block param in the block which is to be executed
        i += 1
    end
end

puts()
each(numbers) {|number|  puts("Square of #{number} is: #{number**2}")}

# we can verify if the block is given by the user & execute it, if present / specified
def each(array)

    if block_given?
        i = 0
        while(i<array.length())
            number = array.fetch(i,false)
            yield number # yeild -param- anything folled after yeild will act as the block param in the block which is to be executed
        i += 1
        end
    else
        puts("No block given to be executed.")
    end
end

puts()
each(numbers) {|number|  puts("Square of #{number} is: #{number**2}")}
puts()
each(numbers)

# procs are a fancy way to create a block which can accept args & execute code when called.
printf = Proc.new {|args| puts("Proc is printing: #{args}")}

def each_f(array,&block)
    i = 0
    while(i<array.length())
        number = array.fetch(i,false)
        block.call(number)
        i += 1
    end
end

puts()
each_f(numbers, &printf)

# lambda's are also similar to procs, except in two conditions -number of args & -return statement

# while using lambda-keyword we pass in required args like bloack args
printf_lambda = lambda { |item| puts("Lambda is printing: #{item}") }

# while using -> arrow operator we pass the args in parenthesis (params) preceeding the block
printf_lambda_arrow = ->(item) { puts("Lambda Arrow is printing: #{item}") }

puts()
each_f(numbers,&printf_lambda)
puts()
each_f(numbers,&printf_lambda_arrow)

# lambda is strict about the number of arguments

printf_lambda_arrow = ->(item,idx) { puts("Lambda Arrow is printing: #{item} which is at index #{idx}") }
# lambda requires 2 args to run

def each_index(array,&block)
    i = 0
    while(i<array.length())
        number = array.fetch(i,false)
        # here i am calling the lambda by passing exactly 2 args
        block.call(number,i)
        i += 1
    end
end

puts()
each_index(numbers,&printf_lambda_arrow)

# now if we pass more or less args we will get error . . . less number of args
def each_index_wrong_args(array,&block)
    i = 0
    while(i<array.length())
        number = array.fetch(i,false)
        # here i am calling the lambda by passing exactly 1 args whereas the lambda needs two args
        block.call(number)
        i += 1
    end
end

# each_index_wrong_args(numbers,&printf_lambda_arrow) 
# => ERR: wrong number of arguments (given 1, expected 2) (ArgumentError)

