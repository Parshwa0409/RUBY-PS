# PRODUCT CLASS

class Product
  
    # attr_accessor will create a getter & setter for the instance_variables we want easily
    # attr_reader will create a getter for the instance_variables we want easily
    # attr_writer will create a setter for the instance_variables we want easily

    attr_reader :cost
    attr_accessor :count

    def initialize(name,cost,count)
        @name = name
        @cost = cost
        @count = count 
    end

    def display_details
        # self === this keyword
        "One #{self.name} costs $#{self.cost}"
    end

    def product_brought
        if self.count > 0

            # count must have both read & write, herefore I used the "attr_accessor" or else it would give an error
            self.count -= 1
            puts("Product -#{self.name}- purchased successfully, Remaining Stock = #{self.count}")
        end
    end

    # normal getter function
    def name
        @name
    end

    # normal setter method
    def name=(new_name)
        @name = new_name
    end
end



# VENDING MACHINE CLASS 

class VendingMachine
  
    attr_accessor :all_products
    attr_accessor :total_earnings
    attr_accessor :inserted_cash
    attr_accessor :user_balance

    def initialize
        @total_earnings = 0
        
        @all_products = []

        @inserted_cash = 0
        @user_balance = 0
    end

    def returnTotalEarnings
        puts("\nEarnings = #{self.total_earnings}")
    end

    def add_products(product)

        # ask for the admin / V.M operator for inputs.

        self.all_products << product
    end

    def display_all_products
        
        # Listing all the products
        puts("Here is a list of all the Products in the Vending Machiine 👇")

        self.all_products.each do |product|
            puts("CODE = #{all_products.index(product) +1}, DESC = #{product.display_details()}")
        end
    end

    def buy_product
        
        print("\nEnter the product-code of the product you want to buy: ")
        user_choice = gets().chomp().to_i()
        
        if (user_choice <= all_products.length())

            required_product = all_products[user_choice-1]

            if(required_product.count>0)
                print("Enter cash: ")
                self.inserted_cash = gets().chomp().to_i()

                if(self.inserted_cash >= required_product.cost)
                    required_product.product_brought()
                    
                    self.user_balance =  self.inserted_cash - required_product.cost 

                    self.user_balance == 0 ? nil : puts("Here's your balance, #{self.user_balance}")

                    purchase_successful(required_product.cost)

                else

                    puts("The cash amount given to buy the product is not sufficient!!!")
                    puts("Here is your cash, #{self.inserted_cash} back. Please try buying it again.")
                    self.buy_product()

                end

                self.inserted_cash = 0
                self.user_balance = 0
            else
                puts("#{required_product.name} is out of stock.")
            end
        else
            puts("You have entered invalid code, Please try again.")
            self.buy_product()
        end
    end


    def purchase_successful(product_cost)
        self.total_earnings += product_cost
    end


end


# TESTING

vm = VendingMachine.new()

p1 = Product.new("Chips",1,3)
p2 = Product.new("Rice Crakers",2,2)
p3 = Product.new("Vanilla MilkShake",3,1)

vm.add_products(p1)
vm.add_products(p2)
vm.add_products(p3)

vm.display_all_products()

vm.returnTotalEarnings()

vm.buy_product()

vm.returnTotalEarnings()

vm.buy_product()

vm.returnTotalEarnings()


