# There are three parts to this challenge and remember to push your solution.

# PART 1:
# - Create a well named variable that contains the amount of time it took you to get to class
# - Create a complete sentence  that lets us know how you got to class and how long it took
# - Print this complete sentence



# Sorry if my comments are a little informal. I wanted to give you more of an understanding to my thought process, and understanding of concepts rather than generic
# descriptions as I think I normally would if I were commenting this for more simple and formal readability/understanding for another developer.

class TimeToClass
    # Defining the TimeToClass class initialize function. I needed local variables that I could call on for my methods (@time_to_class & @total_time),
    # an empty hash for my time_to_class_history, @last_index variable to store the last index that the time_to_class_history instance method had calculated to.
    # Further explanation in the method itself. The @total_time variable was initialised to store the sum of every return from the time_to_class_history instance method.
    def initialize()
        @time_to_class = 0
        @time_to_class_history = []
        @total_time = 0
        @last_index = 0
    end
    # Defining the time_to_class instance method simply takes the parameters time, and transport_type adding the time to the @time_to_class_history hash, while also printing 
    # these parameters in a string in a readable format.
    # I wanted to make history type hash for methods of transportation, but not double up if the same type was put in once. Ran out of time to remember/figure it out :(
    def time_to_class(time, transport_type)
        # Parsing the parameter time into the @time_to_class local variable
        @time_to_class = time
        # Storing the time into the @time_to_class_history hash, and giving it a symbol :time to allow summation in the time_to_class_hi
        @time_to_class_history.push(time: time)
        # Printing parameters input in a readable format.
        puts "Today it took me #{@time_to_class} minutes to get to class via #{transport_type}"
    end
    # Defining the total_time_to_class instance method which will sum the @time_to_class_history hash :time values and update the @last_index local variable, and print
    # the result in a readable format
    def total_time_to_class
        # This line asks Ruby to starts assigning the @time_to_class_history indexes to the calc variable, starting from the @last_index value by utilising the
        # .drop method
        @time_to_class_history.drop(@last_index).each do |calc|
            # Here calc uses the :time symbol we created earlier to assign the the calc variable as the hash integer value, rather than the returning the actual hash 
            # containing the integer value. Sorry I feel like I didn't really explain this very well.
            @total_time += calc[:time]
        end
        # @last_index is storing the current @time_to_class_history length so the next time @time_to_class_history.drop(index).each do |calc| is called it will
        # start summing ONLY the values stored AFTER @last_index. The @total_time local variable is then stored printed in a readable format.
        @last_index = @time_to_class_history.length
        puts "The total time it has taken you to get to class so far is #{@total_time}"
    end
end

# Creating more readable terminal output
puts "-----------------PART 1-----------------"
puts

# Testing code to confirm it meets requirements set by task given
to_class = TimeToClass.new()
to_class.time_to_class(15, "Uber")
to_class.time_to_class(25, "train")
to_class.time_to_class(10, "car")
to_class.time_to_class(20, "bus")
to_class.time_to_class(17, "bus")
puts
to_class.total_time_to_class
puts
to_class.time_to_class(18, "train")
to_class.time_to_class(22, "car")
puts
to_class.total_time_to_class

puts

# Creating better user functionality by allowing them select not to continue to Parts 2 & 3. Was helpful for solely checking the functionality Part 1 rather than
# commenting out Parts 2 & 3 each time.
def do_you_want_to_continue
    # Checking if the user wants to continue with Part 2 & 3 of the script, and collecting an input from them
    puts "Do you want to see Parts 2 & 3? (y/n)"
    answer = gets.chomp
    # Providing a case that only excepts either "yes" or "y" to continue, or "no" or "n" to exit.
    case answer
        # Instantiating the case that if the user inputs "yes" or "y" the loop ends and the script continues to Parts 2 & 3.
    when "yes", "y"
        # Instantiating the case that if the user inputs "no" or "n" the terminal session is ended
    when "no", "n"
        exit
        # Here I placed an else component to the case the user passed an invalid input. I clear the terminal and call the method again, making it look as though
        # they have no choice but to put a valid input to continue
    else
    puts `clear`
    do_you_want_to_continue
    end
end

# Calling my do_you_want_to_continue method, and clearing the terminal for Parts 2 & 3 so there is no screen clutter
do_you_want_to_continue
puts `clear`

# PART 2:
# You are working at a bar where you have a current backlog of drinks to make:
# 3 cocktails
# 2 waters
# and
# 6 beers

# Write a program that asks the customer for their order.
#   if they order a cocktail, add one to the number of cocktails you need to make,
#   if they order a water, add one to the number of waters you need to make,
#   if they order a beer, add one to the number of beers you need to pour

# Print the final drinks order so you know what to make

# Part Three:
# Cocktails sell for $22, and cost $8 to make
# Beer sell for $12, and cost $3 to pour
# Water sell for $6, and cost $0.15 to make

# Print out the total profit for the orders you have



# I need more practice with arrays and hashes, I feel like I could have utilised them better to parse the drink information and access them giving me
# easier ability to implement functionality. This ended up becoming very method dense, I think it could've been a lot more concise with smarter use of
# hashes and arrays :(

class Drinks

    # Defining my Drinks class initialization, setting default values for my local profit variables so I can tota
    def initialize()
        @cocktail_queue = 3
        @cocktail_profit = 0
        @water_queue = 2
        @water_profit = 0
        @beer_queue = 6
        @beer_profit = 0
        @total_profit = 0
        @first_order_run = true
    end
    
    def take_drink_order
        # Welcome message for take_drink_order, the end of this instance method contains @first_order_run = false. So, this Welcome message should only
        # run upon the first call of take_drink_order.
        if @first_order_run == true
            puts "Welcome to Getter Drunk Academy."
            # \n to create line break between these two put lines without a standalone puts, could probably have implemented this synatx in more places with
            # multiple consecutive puts calls
            puts "\nWhat sort of drink can I get for you? We have water, beers, and cocktails available:"
            drink_ordered = gets.chomp
        elsif @first_order_run == false
            puts "What sort of drink can I get for you? We have water, beers, and cocktails available:"
            drink_ordered = gets.chomp
        end
        # Creating a case statement for the different outcomes of user input for drinks_ordered.
        case drink_ordered
        # Defining what happens if the user inputs the string "cocktail" or "cocktails" into this loop (I added cocktails as well as this was the term used)
        # in defining what drinks the user could order, and my brain wouldn't let me not write the word as a plural >.< I did the same with "beer" & "beers"
        when "cocktail", "cocktails"
            # Calling the how_many method, and adding however many cocktails they would like to the current queue total
            @cocktail_queue += how_many.to_i
            # Setting @valid_input = true just allows me to clear the terminal further down prior to the profit calculation.
            valid_input = true
        # Defining what happens if the user inputs the string "water" into this loop, both lines of code function the same was as in the when statement
        # above
        when "water" 
            @water_queue += how_many.to_i
            valid_input = true
        # Defining what happens if the user inputs the string "beer" or "beers" into this loop. 
        when "beer", "beers"
            @beer_queue += how_many.to_i
            valid_input = true
        # Allowing the user to type some common inputs for not wanting to continue
        when "no", "quit", "exit"
        puts `clear`
        puts "Ok! We hope to see you at Getter Drunk Academy again soon (:"
        puts
        exit
        # Bartenders have feelings too   
        when "I hate you"
        puts `clear`
        puts ":("
        puts
        exit
        else
            # Creating a loop that more or less acts as input validation. Checks for all appropriate/valid input and only enters the loop if the input is invalid.
            # Was there a way to make this shorter?
            until drink_ordered == "cocktail" or drink_ordered == "water" or drink_ordered == "beer" or drink_ordered == "no" or drink_ordered == "quit" or drink_ordered == "no" or drink_ordered == "I hate you"
                puts "We don't serve that here or that was an invalid input. Can I get you a water, a beer, or a cocktail instead?:"
                drink_ordered = gets.chomp()
                # I needed to remake case statement as a way to fix a testing issue I was having. The issue was that if a user entered a fringe case,
                # upon re-entering their request, if valid, would not add correctly to the counter. Without it, so this fixes that problem, but creates a massive block
                # of reused code. I should have refactored but didn't realise until I didn't have enough time to refactor. It's late >.<
                # It did work if upon re-entering a valid fringe case input.
                # The whole case block functions as explained above.
                case drink_ordered
                when "cocktail", "cocktails"
                    @cocktail_queue += how_many.to_i
                    valid_input = true
                when "water" 
                    @water_queue += how_many.to_i
                    valid_input = true
                when "beer", "beers"
                    @beer_queue += how_many.to_i
                    valid_input = true
                when "no", "exit", "quit"
                    puts `clear`
                    puts "Ok! We hope to see you at Getter Drunk Academy again soon (:"
                    puts
                    exit
                when "I hate you"
                    puts `clear`
                    puts ":("
                    puts
                    exit
                end
            end
        end
        # I want the screen to clear after input from the user as to how many drinks they would like, I can't remember why i needed this to only run when valid_input
        # equated to true, because all other valid inputs exit anyway, but it won't format properly without it now :(
        # Lesson learnt: COMMENT AS YOU WORK :P
        if valid_input == true
        puts `clear`
        end
        # Printing the cocktail backlog instance variables, including the new additions as per user input to this method when called.
        puts "I have #{@cocktail_queue} cocktails to make, #{@beer_queue} beers to pour, and #{@water_queue} waters to serve."
        # Setting the instance variable @first_order_run to false so that if the method is called again, won't give them the inital greeting
        @first_order_run = false
    end

    # The start of taking multi-type drink orders. Didn't end up getting time to implement it. Probably would've needed to refactor and use hashes to take
    # drink input or make a bigggggg set (9 total combinations) if elsif else loop.

    # def types_ordered
    #     puts "Would you like to order any other kind of drink?:"
    #     drink_ordered = gets.chomp
    # end

    # Creating the instance how_many which will handle how many of the type of drink that the user would like
    def how_many
        # single standalone puts for a line break to create a less cluttered terminal
        puts
        # Requesting user input for how many of that specific drink type that they would like
        puts "How many of that drink would you like?:"
        no_of_drinks = gets.chomp
        # Ensuring any silly users trying to get a bit wild a correctly dealt with
        if no_of_drinks == "Inventory.length" or no_of_drinks.to_i >= 15
            puts `clear`
            puts "Security guard, he's had too much, gettem outta here!"
            puts
            puts "<boots you out of the door>"
            puts
            exit
        # Data validation to ensure the user can't break the program using a negative number. If the user does not enter a positive number, they enter the
        # until block until 
        elsif no_of_drinks.to_i < 0
            until no_of_drinks.to_i > 0    
                puts
                puts "Please give me a real number"
                puts
                puts "How many of that drink would you like?:"
            end
        end
        # Return a variable for the number of drinks request. Didn't end up needing this variable. Just called how_many.to_i, which I think would function
        # without this explicit return.
        return no_of_drinks
    end

    def total_profit
        @cocktail_profit = @cocktail_profit + ((@cocktail_queue * 22) - (@cocktail_queue * 8))
        @water_profit = @water_profit + ((@water_queue * 6) - (@water_queue * 0.15))
        @beer_profit = @beer_profit + ((@beer_queue * 12) - (@beer_queue * 3))
        # Created profit statement method, and totsl profit statement method1-for-1 in terms of lines of code, but added functionality for future addition of 
        # different drinks makes method applicable elsewhere
        profit_calculation
        # The following standalone puts calls are to help tidy up the format of the terminal output
        puts
        # Prints profit_statement calls for each drink type to show how much profit is being made for each drink type in a readable format 
        puts profit_statement("cocktails", @cocktail_profit)
        puts profit_statement("beer", @beer_profit)
        puts profit_statement("water", @water_profit)
        # Printing the gross_profit_statement to show users how much total profit is being made
        puts
        puts gross_profit_statement(@total_profit)
        puts
    end

    # Creating the profit_calculation instance method that allows for the total profit calculation by simply summing the profit of each drink type
    def profit_calculation
        @total_profit = @cocktail_profit + @beer_profit + @water_profit
    end

    # Creating the profit_statement instance method which allows easy ability to print profit any given drink type, allows reuse of code if more drinks are
    # added rather than writing a puts line for every future added drink and its profit statement
    def profit_statement(drink, profit)
        # Only thing of interest here is using the %.2f % profit method (is this a method? A reassignment?) to force two decimal places as this is a returning
        # a dollar currency value, the default return would only contain one floating point otherwise
       return "Your profits from #{drink} for your current order queue is $%.2f" % profit
    end

    # Similar to the above profit_statement, this is a small instance method that generates statement showing the total profit made in a readable string format
    def gross_profit_statement(profit)
        return "The total profit you will make from your current order queue is $%.2f" % profit
    end

end

# Making it clear to user this code belongs to Parts 2 & 3 of the challenge and that this is test block 1
puts "-----------------PARTS 2 & 3-----------------"
puts
puts "                   <TEST 1>          "
puts
# Creating a Drinks class object called drinks
drinks = Drinks.new()
# Testing to see if the initial call of take_drink_order instance method works
drinks.take_drink_order
# Testing to see if the initial call of the the total_profit instance method works
drinks.total_profit
# Waiting to allow user to read output, before clearing to remove terminal clutter, and move into test block 2
sleep 2.0
puts `clear`
puts "                  <TEST 2>         "
puts
# Testing to add more orders, to see if the backlog properly adding to the queue total each time the instance method is called.
drinks.take_drink_order
drinks.take_drink_order
# Testing to see if the total_profit method is properly functioning and outputting the correct profit calculations, given a previous call.
drinks.total_profit

# I had created a list of other functionality I wanted to add but ran out of time for in Trello on this board:
    # https://trello.com/invite/b/xxv3hIdE/fc44b4ccfa6d416bda00d6bf517c7f12/timeandbar

# Testing spreadsheet can be found at:
    # https://docs.google.com/spreadsheets/d/13qj99yQ2HsNr4nrWPk6Q0-tcpSZZ0qyIhITWbl64qvI/edit?usp=sharing