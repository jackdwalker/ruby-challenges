# Write a program which will ask users for a string input.
# The program should display the input unless, it contains the letter 's'.

# If 's' is included change the output so that it will be 'th' instead.

# Examples:
# input = say hi
# output = thay hi

# input = mississippi
# output = miththiththippi

# Hint:
# Look up String on Ruby docs to help.

# Check your solution by running:
# ruby 15_change_letters.rb

def change_letters
    puts "Please enter a string: "
    input_arr = gets.chomp.downcase.split("")
    input_arr.each do |letter|
        if letter == "s"
            input_arr[input_arr.index(letter)] = "th"
        end
    end
    puts input_arr.join("")
end

change_letters
# Your code here