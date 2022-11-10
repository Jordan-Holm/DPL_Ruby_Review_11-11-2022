require "colorize"

@cars = [ {make: "Ford", model: "Ranger", price: 12000}, {make: "Mazda", model: "Mazda3", price: 6000} ]
Tax_rate = 0.0725

def menu()

    puts "1) View Our Cars".colorize(:light_blue)
    puts "2) add a car to the lot".colorize(:light_blue)
    puts "3) Buy car".colorize(:green)
    puts "4) Delete Car".colorize(:red)
    puts "5) Exit".colorize(:red)

    puts = "Please enter your choice"
    input = gets.to_i

    case input
    when 1
        # View cars array
        puts "\n"
        show_cars(@cars)
    when 2 
        # Add a car to lot
        add_car(@cars)
    when 3
        # buy a car
        puts "How much money do you have?"
        money = gets.to_i
        puts "\n"
        delete_or_buy_car(@cars, "buy", money)
    when 4
        # delete a car
        puts "\n"
        delete_or_buy_car(@cars, "delete", 0)
    when 5
        # leave program
        exit
    else
        puts "Error, not a valid choice"
        menu
    end

    # OR

    # if input == 1
    #     show_cars(@cars)
    # elsif input == 2
    #     #add car to lot
    # elsif input == 3
    #     exit
    # else
    #     puts "Error, not a valid choice"
    #     menu
    # end
end

def show_cars(cars_arr)

    
    cars_arr.each_with_index do |car, i|
        puts "car #{i + 1}".colorize(:black).on_green
        puts "Make: #{car[:make]}".colorize(:light_blue)
        puts "Model: #{car[:model]}".colorize(:light_blue)
        puts "Price: #{car[:price]}".colorize(:green)
        after_tax = car[:price] + (car[:price] * Tax_rate)
        puts "Price after tax: #{after_tax}".colorize(:green)
    end

    puts "\n"
    menu

end

def add_car(cars_arr)
    
    puts "What is the make?".colorize(:black).on_white
    make = gets.strip
    puts "What is the model?".colorize(:black).on_white
    model = gets.strip
    price = Random.rand(1000..50000)
    puts "This car costs $#{price}".colorize(:green)
    puts "Added to lot\n".colorize(:yellow)

    new_car = { make: make, model: model, price: price}
    cars_arr << new_car

    menu
end

def delete_or_buy_car(cars_arr, type, money)

    cars_arr.each_with_index do |car, i|
        puts "car #{i + 1}".colorize(:black).on_green
        puts "Make: #{car[:make]}".colorize(:light_blue)
        puts "Model: #{car[:model]}".colorize(:light_blue)
        puts "Price: #{car[:price]}".colorize(:green)
        if type == "buy"
            after_tax = car[:price] + (car[:price] * Tax_rate)
            puts "Price after tax: #{after_tax}".colorize(:green)
        end
    end
    puts "\n"

    if type == "delete"
        puts "What car would you like to delete?".colorize(:white).on_red
        puts "if none, enter '0'".colorize(:light_blue)
        input = gets.to_i

        cars_arr.each_with_index do |car, i|
            if (i + 1) == input
                puts "#{car[:make]} #{car[:model]} deleted\n".colorize(:red)
                cars_arr.delete_at(i)
            end
        end

        menu
    else
        puts "You have $#{money}".colorize(:black).on_green
        puts "What car would you like to buy?".colorize(:light_blue)
        puts "if none, enter '0'".colorize(:light_blue)
        input = gets.to_i

        cars_arr.each_with_index do |car, i|
            if (i + 1) == input
                after_tax = car[:price] + (car[:price] * Tax_rate)
                if money >= after_tax
                    puts "You bought a #{car[:make]} #{car[:model]}".colorize(:yellow)
                    money_left = money - after_tax
                    puts "You have $#{money_left} left over".colorize(:black).on_green
                    puts "enjoy your day".colorize(:light_blue)
                    exit
                else
                    puts "you can't afford this car :(".colorize(:red)
                end
            end
        end

        menu
    end
end

puts "\nwelcome to a Ruby Car Lot\nPlease select a choice"
menu