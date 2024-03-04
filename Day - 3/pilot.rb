module CommonOperations
    private 
    def withdrwal_possible?(amt,usr)
        amt <= usr[:balance]
    end
    def withdrawl(usr)
        begin
            print("Enter the amount to be withdrwan: ")
            amt = gets().chomp().to_i()

            if withdrwal_possible?(amt,usr)
                usr[:balance] -= amt
            else
                puts("Insufficient Balance.")
            end

        rescue => e
            puts("ERR: #{e}")
        end
    end
    def check_balance(usr)
        puts("Account Balance: #{usr[:balance]}")
    end
end



class ATM
    include CommonOperations
    attr_accessor :usr, :block_user
    def initialize(usr)
        @usr = usr
        @block_user = false
        main()
    end

    def main
        verify

        if(!block_user)
            menu
        end
    end

    def verify
        puts("\nHello #{@usr[:name]},")
        print("Enter your ATM-Pin: ")
        pin = gets().chomp().to_i()
        if pin != @usr[:pin]
            @block_user = true
        end
    end


    def menu
        
        print("\nChoose the operaion to be done:\n1)Withdwarl\n2)Check Balance\n3)Quit\nEnter Your Choice: ")
        choice = gets().chomp().to_i()

        puts()
        case choice
        when 1
            self.withdrawl(@usr)
        when 2
            self.check_balance(@usr)
        when 3
            puts("Bye Bye!")
            return
        else
            puts("Invalid option, Please try again!")
        end

        menu()
    end 
end


ATM.new({name:"Paras", balance:1008, pin:1008})
