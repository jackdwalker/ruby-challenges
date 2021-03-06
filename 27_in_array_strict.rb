# Is it in the array strict mode

# Arrays can store all different data types. 
# These arrays can get quite large and it can get 
# quite difficult to keep track of what is in them. 
# Sometimes, we want extra flexibility in an array search, 
# and want control over casing.

# Create a function that will take a string, 
# an array, an additional argument called **strict**, 
# and will return whether or not that string exists in the array. 
# The additional argument, strict, is a boolean argument.

# * If strict is true, in_array_strict? should care about LEtTeR cASinG
# * If strict is false, in_array_strict? should not care about LEtTeR cASinG and should return true for any match

# Create Test::Unit tests in 27_in_array_strict_test.rb

# Examples:
# in_array_strict?("HeLLo", ["hi", "howdy", "Hello"], true) => false
# in_array_strict?("HeLLo", ["hi", "howdy", "Hello"], false) => true

## Optional
# Try completing this challenge without using any array 
# helper methods, except for .each

def in_array_strict?(string, arr, strict)
    # your code goes here
    # If strict is false, array inputs and string need to be downcased, and compared (by iterating over the array comparing |x| x==string)
    # If strict is true, array inputs and string remain unchanged, and compared (by iterating over the array comparing |x| x==string)
    # Return for both cases should be a boolean value
    case strict
    when true
        arr.each do |element|
            if element == string
                return true
            end
        end
        return false

        # More elegant solution than above
        # arr.include?(string) ? true : false
    when false
        # Better to downcase the element variable in the array iteration for better performance.
        # Otherwise you're iterating through the array downcasing everything when it may only be the first
        # element that is a match, and you'll have downcased a n-length array

        # arr.map!{ |x| x.downcase }

        string.downcase!
        arr.each do |element|
            if element.downcase == string
                return true
            end
        end
        return false

        # Not the include method is more performance heavy here because you need to downcase the entire array 
        # encountering the same problem as above

        # arr.downcase.include?(string.downcase) ? true : false 
    end
end

puts in_array_strict?("HeLLo", ["hi", "howdy", "Hello"], true)
puts in_array_strict?("HeLLo", ["hi", "howdy", "Hello"], false)