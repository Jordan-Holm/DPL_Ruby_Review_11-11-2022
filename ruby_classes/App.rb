require_relative "shopper"
require_relative "main_menu"

class App
    attr_accessor :shopper

    def initialize()

        @shopper = create_shopper

        @menu = Main_menu.new(@shopper)

    end

    def create_shopper
        name = ask_question("your name")
        money = ask_question("how munch money you have").to_f
        cart = []

        @shopper = Shopper.new(name, money, cart)
    end

    def ask_question(question)
        puts "Please enter #{question}"
        gets.strip
    end

end

app = App.new()