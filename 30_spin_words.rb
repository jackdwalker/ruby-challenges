# Spin words
# Difficulty: medium

# Write a function that takes in a string of one or more words, 
# and returns the same string, but with all five or more letter words 
# reversed. 

# Strings passed in will consist of only letters and spaces. 
# Spaces will be included only when more than one word is present.

# Examples:
# spin_words( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
# spin_words( "This is a test") => returns "This is a test" 
# spin_words( "This is another test" )=> returns "This is rehtona test"

# Tests provided use rspec

def spin_words (words)
    # your code goes here
    # Method 1: Learn regex



    # Method 2: Array of words, check word length. If  > 5, flip.

    words_arr = words.split(" ")

    words_arr.map do |word|
        if word.length >= 5
            word.reverse!
        end
    end

    return words_arr.join(" ")

    # Method 3: Try it with characters array to make it more complicated



end

