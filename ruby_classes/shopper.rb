class Shopper 

    attr_accessor :money, :name, :cart

    def initialize(name, money, cart)
        @name = name
        @money = money
        @cart = cart
    end

    def money_adjust(num)
        @money += num
    end

    def show_cart

        @cart.each_with_index do |item, i|
            puts "#{i + 1}) "
            item.each do |key, value|
                puts "#{key} - #{value}"
            end
        end

    end
end