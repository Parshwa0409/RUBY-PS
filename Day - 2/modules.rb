# A module is a collection of class, methods, variables, and constants stored in a container.

# Modules can be used o avoid any name conflicts

module Insrument
    class Ruler
      attr_accessor :length
    end
end


module Kingdom
    class Ruler
      attr_accessor :name
    end
end

scale = Insrument::Ruler.new()
united_kingdom = Kingdom::Ruler.new()

scale.length = 15
united_kingdom.name = 'Queen Elizabeth II'

# another heirarchical example

# Student > Branch(CSE,ISE,EEE) > Each Branch Different Subjects
# Nested modules

module Subjects
  module CSE
    class FACD
        attr_accessor :instructor
        def initialize(name)
            @instructor = name
        end
    end
  end
  
  module ISE
    class FACD
        attr_accessor :instructor
        def initialize(name)
            @instructor = name
        end
    end
  end  
end

ise_facd = Subjects::ISE::FACD.new('Lisha')


# Mixin
=begin
    Ruby doesn’t handle multiple inheritance.
    So how to organize a class to keep it maintainable in the long term?
    The answer is by applying the Composition over Inheritance principle.

    include 
        - need an instance to call any meth() of included module, 
        - maked the included module the immediate ancestor/parent of the class
    
    extend
        - no need to have the instace to call the meth() or access the variables of the extened module
    
    prepend 
        - the module becomes the child in the ancestor chain for the given-class
        - so if class has meth-x() & module has meth-x(), if we call meth-x() through class, we start check for that method in ancestor chain & since module is prepended it will be the first encounter where we check for meth-x() and  since it is present there module's meth-x() is executed
=end


module Commentable
    def comment
        puts("I like comments.")
    end
end

# include
class PostI
include Commentable
    def comment
        puts("Include Comment")
    end
end

post_include = PostI.new()
post_include.comment()
# post_include.ancestors() # Child[post-i -> commentable -> others... ]Ancestors

# prepend
class PostP
prepend Commentable
    def comment
        puts("Include Comment")
    end
end

post_prepend = PostP.new()
post_prepend.comment()
# post_prepend.ancestors() # Child[commentable -> post-p -> others... ]Ancestors

# extend
class PostE
extend Commentable
        def comment
            puts("Extend Comment")
        end
end

# static call result like prepend
PostE.comment()
    
# with object created result similar to include
post_extend = PostE.new()
post_extend.comment()