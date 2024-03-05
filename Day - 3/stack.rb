class Stack

    attr_accessor :arr, :length

    def initialize(length)
        @arr = []
        @length = length
    end


    def push(element)
        puts()
        if(@arr.length == length)
            puts("Stack Overflow, PUSH FAILED !!!")
        else
            puts("#{element} PUSHED INTO STACK.")
            @arr << element
            puts("STACK - #{@arr}")
        end
    end

    def pop()
        puts()
        if(arr.length == 0)
            puts("STACK EMPTY !!!")
        else
            puts("POPPED ELEMENT: #{@arr.pop()}")
        end
    end

end


s1 = Stack.new(5)

s1.push(1)
s1.push(2)
s1.push(3)
s1.push(4)
s1.push(5)
s1.push(6)

s1.pop()
s1.pop()
s1.pop()
s1.pop()
s1.pop()
s1.pop()
