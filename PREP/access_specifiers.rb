class Student
    def initialize(id,name)
        @id = id
        @name = name
    end

    protected

    def print_everything
        puts("Name: #{@name}, ID: #{@id}")
    end

end


s1 = Student.new(6452,"Parshwa")

s1.print_everything()
