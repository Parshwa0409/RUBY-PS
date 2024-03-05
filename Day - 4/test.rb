students = [
    {name:"Student 1", age:14, scores:[90,90,90]},
    {name:"Student 2", age:14, scores:[98,90,78]},
    {name:"Student 3", age:14, scores:[90,100,45]},
    {name:"Student 4", age:14, scores:[90,70,80]},
    {name:"Student 5", age:15, scores:[90,50,60]},
    {name:"Student 6", age:15, scores:[99,98,97]},
    {name:"Student 7", age:16, scores:[100,100,100]},
    {name:"Student 8", age:17, scores:[98,88,99]},
    {name:"Student 9", age:18, scores:[100,100,100]},
]

def top_students(students, age, n)
    
    students = students.each do |student|
        student[:total] = student[:scores].reduce(:+)
    end

    result = students.sort { |a, b| b[:total] <=> a[:total] }

    final_result = result[0,n].select do |student|
      student[:age] > age
    end

    puts final_result

end

def top_students_2(students, age, n)
    puts students.select {|student| student[:age] > age }.sort { |a, b| b[:scores].reduce(:+) <=> a[:scores].reduce(:+) }[0,n]
end


top_students_2(students,14,4)
