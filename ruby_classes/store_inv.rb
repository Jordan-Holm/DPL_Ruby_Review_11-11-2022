require_relative "main_menu"

class Store_inv
    attr_accessor :shopper

    def initialize(shopper)
        @shopper = shopper

        @store_inv = [
            {product: "banana", cost: 0.99},
            {product: "apple", cost: 1.25},
            {product: "Frosted Flakes", cost: 4.99}
        ]

    end

    def show_inv()

        @store_inv.each_with_index do |item, i|
            puts "#{i + 1}) "
            item.each do |key, value|
                puts "#{key} - #{value}"
            end
        end
        puts
    end

    def add_cart_item()

        show_inv()

        user_input = gets.strip.to_i
        
        @store_inv.each_with_index do |item, i|
            if i == ( user_input - 1 )
                @shopper.cart << item
            end 
        end

    end

end