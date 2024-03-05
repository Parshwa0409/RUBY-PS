class Book
  attr_reader :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end

class Magazine
  attr_reader :tile,:cost

  def initialize(title,cost)
    @title = title
    @cost = cost
  end

end

class Library
  include Enumerable

  def initialize
    @books = []
    @magazine = []
  end

  def add_book(book)
    @books << book
  end
  
  def add_magazine(mag)
    @magazine << mag
  end

  def each
    @books.each do |book|
      yield book
    end

    @magazine.each do |mag|
      yield mag
    end
  end
end

# Usage:
library = Library.new
library.add_book(Book.new("The Great Gatsby", "F. Scott Fitzgerald"))
library.add_book(Book.new("Moby Dick", "Herman Melville"))
library.add_book(Book.new("1984", "George Orwell"))

library.add_magazine(Magazine.new("M1", 1000))
library.add_magazine(Magazine.new("M2", 1000))
library.add_magazine(Magazine.new("M3", 1000))

# Now you can use Enumerable methods with the library:
library.each { |el| puts el.class == Magazine? }
# => ["The Great Gatsby", "Moby Dick", "1984"]

# library.select { |book| book.author == "George Orwell" }
# => [#<Book:0x00007f8c1a8b8b88 @title="1984", @author="George Orwell">]