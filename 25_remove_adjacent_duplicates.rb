# Remove adjacent duplicates

# Sometimes we have input with adjacent duplicates, and we want to remove
# those adjacent duplicates, keeping the original input in order.

# Create a method, which takes a string argument and returns a string
# with duplicate adjacent elements removed, preserving the original
# order of characters and preserving original case. Your algorithm
# should be case sensitive, meaning that "Aa" should not be considered
# duplicate adjacent characters, like "aa" or "AA".  

# *E.g.* remove_adjacent_duplicates("AAaAbbCCCcDDcDA") should return "AaAbCcDcDA"

# *E.g.* remove_adjacent_duplicates("abcABCabcABC") should return exactly the same string: "abcABCabcABC"

def remove_adjacent_duplicates(input)
    # Your code goes here
    # Split string into array of individual characters
    input_arr = input.chars
    index = 0
    # Solution 1: Iterate over array of characters, deleting |x| then adding it to the index in whichever position it was found
    input_arr.each do |char|
        if input_arr.count(char) > 1
            input_arr.delete_at(index)
        end
        index += 1
    end
    # Solution 2: Iterate over array of characters, comparing the index of |x| to that x-1 and x+1 and if either match deleting itself by index
    input_arr.each do |char|
        # Compare char to character at (index - 1) if true, remove that index > maybe use a while loop to catch multiple identical characters
        if index > 0
            while char == input_arr[(index - 1)]
                input_arr.delete_at(index - 1)
            end
        end
        while char == input_arr[(index + 1)]
            input_arr.delete_at(index + 1)
        end
        index += 1
    end
    return input_arr.join
end

