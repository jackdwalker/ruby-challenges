# You have to stop the infamous hackerman by writing a basic security program.

# Your task is to write a program which will ask the user for input twice.
# Both times should ask the user to type words and will display the FIRST input.

# However if any of the words in the second input match with a word from the
# first input it should say "HIDDEN" instead of the matched word.

# Example:
# first_input = bob rob dob mob
# second_input = kob fob dob

# output = bob rob HIDDEN mob

# Check your solution by running:
# ruby 14_hackerman.rb



# Your code here
def compare_input()
    puts "Please enter your first string: "
    string_1_arr = gets.chomp.downcase.split(" ")
    puts "Please enter your second string: "
    string_2_arr = gets.chomp.downcase.split(" ")

    # See if each element in string_1_arr has any matching words in string_2_arr, if true replace |word| with HIDDEN
    string_1_arr.each do |word|
        if string_2_arr.include?(word)
            string_1_arr[string_1_arr.index(word)] = "HIDDEN"
        end
    end

    puts string_1_arr.join(" ")
end

compare_input


# Beast mode:
# Does your code deal with capital letters? Update your solution so that
# they will be downsized if they are input but HIDDEN remains capitalised.