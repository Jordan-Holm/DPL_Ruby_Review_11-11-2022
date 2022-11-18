require_relative "store_inv"

module Menu_helper
    def display_menu
        puts "1) view store items"
        puts "2) add to cart"
        puts "3) view cart"
    end

    def view_inv
        @store_inv.show_inv()
        menu
    end
end

class Main_menu
    attr_accessor :store_inv
    include Menu_helper

    def initialize(shopper)
        @shopper = shopper
        @store_inv = Store_inv.new(@shopper)

        menu
    end

    def menu
        display_menu()

        user_input = gets.strip.to_i

        case user_input
        when 1
            #view store items
            view_inv() 
            menu
        when 2
            # add to cart
            @store_inv.add_cart_item()
            menu
        when 3
            #view cart
            puts @shopper.show_cart()
            menu
        else
            puts "invalid input"
            menu
        end
    end

end